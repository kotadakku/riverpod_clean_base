
import 'package:riverpod_base/src/data/data.dart';
import 'package:riverpod_base/src/domain/models/models.dart';
import 'package:riverpod_base/src/presentation/controller/auth/auth_controller.dart';
import 'package:riverpod_base/src/routes/app_router.dart';
import 'package:riverpod_base/src/service/service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginController extends StateNotifier<User> {
  final AuthService authService;
  final StateController<bool> loading;
  final StateController<String> token;
  final Ref ref;

  LoginController({required this.authService,
    required this.loading,
    required this.token,
    required this.ref
  }) : super(User()) {

  }

  Future<void> login({required String username, required String password, required BuildContext context}) async {
    loading.state = true;

    var value = await authService.login({
      'username': username,
      'password': password
    });

    if(value != null){
      GetStorageHelper().save(
          key: CacheManagerKey.TOKEN.toString(),
          value: value
      );
      ref.watch(authControllerProvider.notifier).state = true;
      token.state = value;
      getDetailUser();
      Navigator.pushNamed(context, Routes.HOME);
    } else {
      // Get.defaultDialog(
      //   title: 'notification'.tr,
      //   middleText: 'login_failed'.tr,
      //   textConfirm: 'Ok',
      //   confirmTextColor: Colors.white,
      //   onConfirm: () {
      //     Get.back();
      //   },
      // );
    }
    loading.state = false;
  }
  Future<void> getDetailUser() async {
    var value = await authService.getDetailUser();

    if(value != null){
      state = value;
    } else {
      // Get.defaultDialog(
      //   title: 'notification'.tr,
      //   middleText: 'login_failed'.tr,
      //   textConfirm: 'Ok',
      //   confirmTextColor: Colors.white,
      //   onConfirm: () {
      //     Get.back();
      //   },
      // );
    }
  }

  void logout() {
    ref.watch(authControllerProvider.notifier).state = false;
    token.state = "";
    authService.logout();
  }
}


final loadingProvider = StateProvider<bool>((ref) => false);


final loginControllerProvider = StateNotifierProvider<LoginController, User>((ref) {
  return LoginController(
    authService: ref.watch(authServiceProvider),
    loading : ref.watch(loadingProvider.notifier),
    token: ref.watch(tokenProvider.notifier),
    ref: ref
  );
});



