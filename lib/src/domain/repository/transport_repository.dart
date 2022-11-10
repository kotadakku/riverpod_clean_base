import 'package:riverpod_base/src/data/data.dart';
import 'package:riverpod_base/src/domain/models/models.dart';
import 'package:dio/dio.dart';

abstract class TransportRepository{
  Future<Responses<Transport>> getTransports({Options? options,
    Map<String, dynamic>? queryParameters});
  Future<Responses<TransportHistory>> getHistoryTransports({Options? options,
    Map<String, dynamic>? queryParameters});
  Future<Responses<TransportHistory>> createHistoryTransports({data, Options? options, Map<String, dynamic>? queryParameters});

  Future<Responses<bool>> createUserHistory({data, Options? options, Map<String, dynamic>? queryParameters});
  Future<Responses<Transport>> getTransport({Map<String, dynamic>? queryParameters, Options? options});
  Future<Responses<bool>> updateTransport({required String id, data, Map<String, dynamic>? queryParameters, Options? options});
}