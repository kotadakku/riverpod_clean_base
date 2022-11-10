
import 'package:riverpod_base/src/data/data.dart';
import 'package:riverpod_base/src/service/service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthController extends StateNotifier<bool> {
  final AuthService authService;
  final StateController<String> token;

  AuthController({
    required this.authService,
    required this.token
  }) : super(false) {}

  Future<void> autoLogin() async {
    final storage = FlutterSecureStorage();
    String? username = await storage.read(
        key: CacheManagerKey.USERNAME.toString());
    String? password = await storage.read(
        key: CacheManagerKey.PASSWORD.toString());
    if (username != null && password != null) {
      var value = await authService.login({
        'username': username,
        'password': password
      });

      if(value != null){
        GetStorageHelper().save(
            key: CacheManagerKey.TOKEN.toString(),
            value: value
        );
        token.state = value;
        state = true;
      }
    }
  }
}


final tokenProvider = StateProvider<String>((ref) => '');


final authControllerProvider = StateNotifierProvider<AuthController, bool>((ref) {
  return AuthController(
    authService: ref.watch(authServiceProvider),
    token : ref.watch(tokenProvider.notifier)
  );
});



