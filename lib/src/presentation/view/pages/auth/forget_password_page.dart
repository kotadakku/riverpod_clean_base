
import 'package:riverpod_base/src/presentation/view/theme/theme.dart';
import 'package:riverpod_base/src/presentation/view/widgets/widgets.dart';
import 'package:riverpod_base/src/translation/app_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/phone_field_widget.dart';

class ForgetPasswordPage extends StatelessWidget {
  ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBarBase(

        leading: const AppbarButtonBack(),
        middle: AppbarTitle(title: AppLocalization.of(context)!.translate('forget_password')),
      ),
      extendBody: true,
      floatingActionButton: FloatActionButtonNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: const CupertinoBottomBar(),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 190.h,),
              Container(
                height: 48.h,
                margin: EdgeInsets.symmetric(horizontal: 40.w),

                child: Form(
                  // key: _controller.formKey,
                  child: PhoneFieldWidget(),
                ),
              ),

              SizedBox(height: 16.h,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40.w),
                child: CupertinoButton(
                    color: AppColor.fillPositive,
                    borderRadius: BorderRadius.circular(27),
                    child: Center(
                      child: Text(AppLocalization.of(context)!.translate('send_code_opt'),
                        style: const TextStyle(
                            color: AppColor.content,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                    onPressed: (){
                      // _controller.sendOtp();
                    }),
              )
            ],
          ),
        )
      )
    );
  }
}
