import 'package:riverpod_base/src/data/data.dart';
import 'package:riverpod_base/src/domain/models/models.dart';
import 'package:riverpod_base/src/domain/repository/user_repository.dart';
import 'package:riverpod_base/src/presentation/controller/controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class AuthService {
  final Ref ref;
  final UserRepository userRepository;
  AuthService({required this.ref, required this.userRepository});

  Future<String?> login(data) async {
    try {
      final result = await userRepository.getToken(
          data: data
      );
      if (result.statusCode == CODE_SUCCESS) {
        return result.objects ?? '';
      } else {

      }
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
  }

  Future<User?> getDetailUser() async {
    String token = ref.watch(tokenProvider);
    try{
      final result = await userRepository.getUser(
          options: Options(
              headers: {
                'Authorization': 'Bearer ${token}'
              }
          )
      );
      if(result.statusCode == CODE_SUCCESS ){
        saveUser(result.response);
        return result.objects;
      }
      else{
        if (kDebugMode) {
          print(result.msg);
        }

      }
    } catch (error){
      if (kDebugMode) {
        print(error.toString());
      }
    }
    return null;
  }

  void saveUser(data) {
    GetStorageHelper().save(
        key: CacheManagerKey.INFORMATION_USER.toString(),
        value: data
    );
  }

  void logout(){
    GetStorageHelper().delete(
        key: CacheManagerKey.INFORMATION_USER.toString(),
    );
    final storage = FlutterSecureStorage();
    storage.delete(
        key: CacheManagerKey.USERNAME.toString());
    storage.delete(
        key: CacheManagerKey.PASSWORD.toString());
  }


}

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService(
      ref : ref,
      userRepository: ref.watch(userRepositoryProvider)
  );
});