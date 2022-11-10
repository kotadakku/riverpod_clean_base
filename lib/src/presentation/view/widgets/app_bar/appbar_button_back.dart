
import 'package:riverpod_base/src/presentation/view/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppbarButtonBack extends StatelessWidget {
  const AppbarButtonBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 24.h,
        width: 24.h,
        child: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(
            CupertinoIcons.back,
            color: AppColor.content,
          )
        )
    );
  }
}
