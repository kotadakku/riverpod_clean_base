import 'package:riverpod_base/src/presentation/view/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppbarTitle extends StatelessWidget {
  final String? title;
  const AppbarTitle({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height:33.h,
        child: Text('$title',
          style: TextStyle(
              color: AppColor.content,
              fontSize: AppSize.textXl,
              fontWeight: FontWeight.w500
          ),
        )
    );
  }
}
