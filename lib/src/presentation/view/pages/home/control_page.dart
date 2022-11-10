import 'package:riverpod_base/src/presentation/controller/auth/auth_controller.dart';
import 'package:riverpod_base/src/presentation/controller/home/tabbar_controller.dart';
import 'package:riverpod_base/src/presentation/view/pages/pages.dart';
import 'package:riverpod_base/src/presentation/view/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ControlPage extends ConsumerWidget {
  const ControlPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabIndex = ref.watch(tabBarControllerProvider);
    final isLogged = ref.watch(authControllerProvider);
    return WillPopScope(
      onWillPop: () => _onWillPop(context, ref),
      child:  Scaffold(
          floatingActionButton: isLogged? FloatActionButtonNavigationBar(): const SizedBox(),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          resizeToAvoidBottomInset: false,
          bottomNavigationBar: const CupertinoBottomBar(),
          body: IndexedStack(
            index: tabIndex,
            children: const [
              HomeWidget(),
              ScanQRWidget(),
              AccountWidget(),
            ],
          )
      )
    );

  }
  Future<bool> _onWillPop(BuildContext context, WidgetRef ref) async{
    if(ref.watch(tabBarControllerProvider) != 0){
      ref.read(tabBarControllerProvider.notifier).changeTabIndex(0, context);
      return false;
    }
    return true;
  }
}
