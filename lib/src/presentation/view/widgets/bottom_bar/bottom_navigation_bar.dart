import 'package:riverpod_base/src/presentation/controller/auth/auth_controller.dart';
import 'package:riverpod_base/src/presentation/controller/home/tabbar_controller.dart';
import 'package:riverpod_base/src/presentation/view/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CupertinoBottomBar extends ConsumerStatefulWidget {
  const CupertinoBottomBar({Key? key}) : super(key: key);

  @override
  _CupertinoBottomBarState createState() => _CupertinoBottomBarState();
}

class _CupertinoBottomBarState extends ConsumerState<CupertinoBottomBar> {

  late ValueListenable<ScaffoldGeometry> geometryListenable;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    geometryListenable = Scaffold.geometryOf(context);
  }

  @override
  Widget build(BuildContext context) {
    final tabIndex = ref.watch(tabBarControllerProvider);
    final isLogged = ref.watch(authControllerProvider);
    return buildNotchedCupertino(
      child: CupertinoTabBar(
        currentIndex: tabIndex,
        onTap: (index){
          FocusManager.instance.primaryFocus!.unfocus();
          ref.read(tabBarControllerProvider.notifier).changeTabIndex(index, context);
        },
        inactiveColor: AppColor.content3,
        activeColor: AppColor.accent,
        border: Border.all(color: Colors.white, width: 0),
        iconSize: 32,
        height: 58.h,
        backgroundColor: AppColor.backgroundLight,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/ic_home.svg',
              color: AppColor.content3,
              height: 26.h,
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/ic_home.svg',
              color: AppColor.fillPositive,
              height: 26.h,
            ),
          ),
          if(isLogged) BottomNavigationBarItem(
              icon: Container(),
              label: ''
          ) ,

          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/ic_user.svg',
              color: AppColor.content3,
              height: 28.h,
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/ic_user.svg',
              color: AppColor.fillPositive,
              height: 28.h,
            ),
          ),
        ],
      )
    );
  }
  Widget buildNotchedCupertino({required Widget child}){
    return CustomPaint(
      painter: _BottomAppBarPaint(
          shape: const CircularNotchedRectangle(),
          geometry: geometryListenable,
          notchMargin: 0,
          color: const CupertinoDynamicColor.withBrightness(
              color: Color(0x4C000000),
              darkColor: Color(0x29000000)
          )
      ),
      child: PhysicalShape(
        clipper: _BottomAppBarClipper(
          shape: const CircularNotchedRectangle(),
          geometry: geometryListenable,
          notchMargin: 0,
        ),
        color: Colors.transparent,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Material(
          color: Colors.transparent,
          child: child,
          elevation: 5,
        ),
      )
    );
  }
}

class _BottomAppBarClipper  extends CustomClipper<Path>{
  const _BottomAppBarClipper({
    required this.geometry,
    required this.shape,
    required this.notchMargin
  }) : super(reclip: geometry);

  final NotchedShape shape;
  final ValueListenable<ScaffoldGeometry> geometry;
  final double notchMargin;
  @override
  getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 10);
    path.arcToPoint(const Offset(10, 0),
        radius: const Radius.circular(10.0),
        clockwise: true);

    path.lineTo(size.width -10, 0);
    path.arcToPoint(Offset(size.width, 10),
        radius: const Radius.circular(10.0),
        clockwise: true);

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(_BottomAppBarClipper oldClipper) {
    return oldClipper.geometry != geometry ||
      oldClipper.shape != shape ||
    oldClipper.notchMargin != notchMargin;
  }

}

class _BottomAppBarPaint extends CustomPainter {
  final ValueListenable<ScaffoldGeometry> geometry;
  final NotchedShape shape;
  final double notchMargin;
  final Color color;
  const _BottomAppBarPaint({
    required this.color,
    required this.geometry,
    required this.shape,
    required this.notchMargin
  });

  @override
  bool shouldReclip(_BottomAppBarPaint oldClipper) {
    return oldClipper.geometry != geometry ||
        oldClipper.shape != shape ||
        oldClipper.notchMargin != notchMargin;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    path.lineTo(0, 10);
    path.arcToPoint(const Offset(10, 0),
        radius: const Radius.circular(10.0),
        clockwise: true);

    path.lineTo(size.width -10, 0);
    path.arcToPoint(Offset(size.width, 10),
        radius: const Radius.circular(10.0),
        clockwise: true);

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawShadow(path, AppColor.content, 10.0, false);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}