

import 'package:riverpod_base/src/data/data.dart';
import 'package:riverpod_base/src/domain/models/models.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_base/src/domain/repository/repository.dart';

class UserRepositoryImpl implements UserRepository{
  @override
  Future<Responses<String>> getToken({data}) async {
    try{
      final response = await ApiProvider().post(
          path: ApiUrls.baseUrl2 + ApiUrls.login,
          data: data
      );

      if(response.data != null){
        String accessToken = response.data;
        return Responses<String>(statusCode: CODE_SUCCESS, objects: accessToken);
      }
      else{
        return Responses<String>(statusCode: CODE_RESPONSE_NULL, msg: '');
      }
    } catch(error){
      if(error is DioError){
        if(error.response?.statusCode == 400){
          return Responses<String>(statusCode: error.response?.statusCode, msg: 'incorrect_login');
        }
      }

      String? errorMessage = DioExceptions.fromDioError(error).toString();

      return Responses<String>(statusCode: CODE_ERROR, msg: errorMessage);
    }
  }

  @override
  Future<Responses<User>> getUser({Options? options}) async {
    try{
      final response = await ApiProvider().get(
          path: ApiUrls.baseUrl2 + ApiUrls.user,
          options: options
      );

      if(response.data != null){
        User user = User.fromJson(response.data);
        return Responses<User>(statusCode: CODE_SUCCESS,
            response: response.data,
            objects: user);
      }
      else{
        return Responses<User>(statusCode: CODE_RESPONSE_NULL, msg: '');
      }
    } catch(error){
      String? errorMessage = DioExceptions.fromDioError(error).toString();
      return Responses<User>(statusCode: CODE_ERROR, msg: errorMessage);
    }
  }

  @override
  Future<Responses<bool>> updatePassword({Options? options, Map<String, String>? queryParameters, data}) async {
    try {
      final response = await ApiProvider().put(
          path: ApiUrls.baseUrl2 + '/rest/V1/customers/me/password',
          data: data,
          options: options,
          queryParameters: queryParameters
      );

      if (response.data != null) {
        bool isSuccess = response.data;
        return Responses<bool>(statusCode: CODE_SUCCESS, objects: isSuccess);
      }
      else {
        return Responses<bool>(statusCode: CODE_RESPONSE_NULL, msg: '');
      }
    } catch (error) {
      String? errorMessage = DioExceptions.fromDioError(error).toString();
      return Responses<bool>(statusCode: CODE_ERROR, msg: errorMessage);
    }
  }

}

final userRepositoryProvider = Provider<UserRepositoryImpl>((ref){
  return UserRepositoryImpl();
});
