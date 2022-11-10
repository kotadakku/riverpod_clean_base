

import 'package:riverpod_base/src/presentation/controller/auth/auth_controller.dart';
import 'package:riverpod_base/src/routes/app_router.dart';
import 'package:riverpod_base/src/service/home/home_service.dart';
import 'package:riverpod_base/src/service/service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TabBarController extends StateNotifier<int>{
  final Ref ref;
  final HomeService homeService;
  TabBarController({required this.ref,
    required this.homeService,
  }) : super(0){
  }

  Future<void> changeTabIndex(int newTabIndex, BuildContext context) async {
    final isLogged = ref.watch(authControllerProvider);
    if(newTabIndex== 2 || newTabIndex== 1){
      if(!isLogged){
        Navigator.pushNamed(context, Routes.LOGIN);
      }else{
        state = homeService.changeTabIndex(newTabIndex);

      }
    } else {
      state = homeService.changeTabIndex(newTabIndex);
    }
  }
}

final tabBarControllerProvider = StateNotifierProvider<TabBarController, int>((ref) {
  return TabBarController(
    homeService: ref.watch(homeServiceProvider),
    ref: ref
  );
});