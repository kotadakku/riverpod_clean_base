

import 'package:riverpod_base/src/data/data.dart';
import 'package:riverpod_base/src/domain/models/models.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class UserRepository {
  Future<Responses<String>> getToken({data});
  Future<Responses<User>> getUser({Options? options});
  Future<Responses<bool>> updatePassword({Options? options, Map<String, String> queryParameters, data});
}
