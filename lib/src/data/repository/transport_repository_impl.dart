import 'package:riverpod_base/src/data/data.dart';
import 'package:riverpod_base/src/domain/models/models.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_base/src/domain/repository/transport_repository.dart';

class TransportRepositoryImpl implements TransportRepository{
  @override
  Future<Responses<Transport>> getTransport({Map<String, dynamic>? queryParameters, Options? options}) async {
    try{
      final response = await ApiProvider().get(
          path: ApiUrls.baseUrl3 + ApiUrls.transports,
          options: options,
          queryParameters: queryParameters
      );
      if(response.data != null){
        try{
          Transport product = Transport.fromJson(response.data['data']['data'][0]);
          return Responses<Transport>(statusCode: CODE_SUCCESS, objects: product);
        }
        catch(error){
          return Responses<Transport>(statusCode: CODE_RESPONSE_NULL, msg: "");
        }

      }
      return Responses<Transport>(statusCode: CODE_RESPONSE_NULL, msg: "");
    } catch (error){
      final errorMessage = DioExceptions.fromDioError(error);
      return Responses<Transport>(statusCode: CODE_ERROR, msg: errorMessage.toString());
    }
  }

  @override
  Future<Responses<Transport>> getTransports({Options? options, Map<String, dynamic>? queryParameters}) async {
    try{
      final response = await ApiProvider().get(
          path: ApiUrls.baseUrl3 + ApiUrls.transports,
          options: options,
          queryParameters: queryParameters
      );
      if(response.data != null){
        List<Transport> products = List.from(
            (response.data['data']['data'] as List).map((e) => Transport.fromJson(e))
        );
        return Responses<Transport>(statusCode: CODE_SUCCESS, listObjects: products,
            totalObject: response.data['data']['total'],
            response: response.data['data']['data'],
            totalPage: response.data['last_page']
        );
      }
      return Responses<Transport>(statusCode: CODE_RESPONSE_NULL, msg: "");
    } catch (error){
      final errorMessage = DioExceptions.fromDioError(error);
      return Responses<Transport>(statusCode: CODE_ERROR, msg: errorMessage.toString());
    }
  }

  @override
  Future<Responses<Transport>> getUserTransports({Options? options, Map<String, dynamic>? queryParameters}) async {
    try{
      final response = await ApiProvider().get(
          path: ApiUrls.baseUrl3 + ApiUrls.historyTransport,
          options: options,
          queryParameters: queryParameters
      );
      if(response.data != null){
        List<Transport> products = List.from(
            (response.data['data'] as List).map((e) => Transport.fromJson(e))
        );
        return Responses<Transport>(statusCode: CODE_SUCCESS, listObjects: products,
          response: response.data['data'],

        );
      }
      return Responses<Transport>(statusCode: CODE_RESPONSE_NULL, msg: "");
    } catch (error){
      final errorMessage = DioExceptions.fromDioError(error);
      return Responses<Transport>(statusCode: CODE_ERROR, msg: errorMessage.toString());
    }
  }

  @override
  Future<Responses<TransportHistory>> getHistoryTransports({Options? options, Map<String, dynamic>? queryParameters}) async {
    try{
      final response = await ApiProvider().get(
        path: ApiUrls.baseUrl3 + ApiUrls.transportHistories,
        options: options,
        queryParameters: queryParameters,
      );
      if(response.data != null){
        List<TransportHistory> products = List.from(
            (response.data['data']['data'] as List).map((e) => TransportHistory.fromJson(e))
        );
        return Responses<TransportHistory>(statusCode: CODE_SUCCESS, listObjects: products,
            totalObject: response.data['data']['total'],
            response: response.data['data']['data'],
            totalPage: response.data['last_page']
        );
      }
      return Responses<TransportHistory>(statusCode: CODE_RESPONSE_NULL, msg: "");
    } catch (error){
      final errorMessage = DioExceptions.fromDioError(error);
      return Responses<TransportHistory>(statusCode: CODE_ERROR, msg: errorMessage.toString());
    }
  }
  @override
  Future<Responses<TransportHistory>> createHistoryTransports({data, Options? options, Map<String, dynamic>? queryParameters}) async {
    try{
      final response = await ApiProvider().post(
        path: ApiUrls.baseUrl3 + ApiUrls.transportHistories,
        options: options,
        queryParameters: queryParameters,
        data: data,
      );
      if(response.data != null){
        TransportHistory history = TransportHistory.fromJson(response.data['data']);
        return Responses<TransportHistory>(statusCode: CODE_SUCCESS, objects: history
        );
      }
      return Responses<TransportHistory>(statusCode: CODE_RESPONSE_NULL, msg: "");
    } catch (error){
      final errorMessage = DioExceptions.fromDioError(error);
      return Responses<TransportHistory>(statusCode: CODE_ERROR, msg: errorMessage.toString());
    }
  }
  @override
  Future<Responses<bool>> createUserHistory({data, Options? options, Map<String, dynamic>? queryParameters}) async {
    try{
      final response = await ApiProvider().post(
        path: ApiUrls.baseUrl3 + ApiUrls.historyTransport,
        options: options,
        queryParameters: queryParameters,
        data: data,
      );
      if(response.data != null){
        return Responses<bool>(statusCode: CODE_SUCCESS, objects: true
        );
      }
      return Responses<bool>(statusCode: CODE_RESPONSE_NULL, msg: "");
    } catch (error){
      final errorMessage = DioExceptions.fromDioError(error);
      return Responses<bool>(statusCode: CODE_ERROR, msg: errorMessage.toString());
    }
  }

  @override
  Future<Responses<bool>> updateTransport({required String id, data, Map<String, dynamic>? queryParameters, Options? options}) async {
    try{
      final response = await ApiProvider().post(
          path: ApiUrls.baseUrl3 + ApiUrls.transports +"/$id",
          options: options,
          queryParameters: queryParameters,
          data: data
      );
      if(response.data != null){
        try{
          return Responses(statusCode: CODE_SUCCESS, objects: true);
        }
        catch(error){
          return Responses(statusCode: CODE_RESPONSE_NULL, msg: "");
        }

      }
      return Responses(statusCode: CODE_RESPONSE_NULL, msg: "");
    } catch (error){
      final errorMessage = DioExceptions.fromDioError(error);
      return Responses(statusCode: CODE_ERROR, msg: errorMessage.toString());
    }
  }

}