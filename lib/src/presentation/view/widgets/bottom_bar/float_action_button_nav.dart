
import 'package:riverpod_base/src/presentation/controller/home/tabbar_controller.dart';
import 'package:riverpod_base/src/presentation/view/theme/theme.dart';
import 'package:riverpod_base/src/routes/app_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class FloatActionButtonNavigationBar extends ConsumerWidget {
  FloatActionButtonNavigationBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 64.h,
      width: 64.h,
      child: FloatingActionButton(
        elevation: 1,
        highlightElevation: 0,
        heroTag: 'home_btn',
        backgroundColor: AppColor.fillPositive,
        focusColor: AppColor.accent100,
        onPressed: () {
          ref.read(tabBarControllerProvider.notifier).changeTabIndex(1, context);
        },
        child: SvgPicture.asset(
          'assets/icons/ic_qr.svg',
          height: 37.h,
          color: AppColor.backgroundLight,
        ),
      ),
    );
  }
}
