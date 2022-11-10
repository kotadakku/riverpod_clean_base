
import 'package:riverpod_base/src/presentation/view/theme/theme.dart';
import 'package:riverpod_base/src/presentation/view/widgets/custom/otp_text_field.dart';
import 'package:riverpod_base/src/presentation/view/widgets/widgets.dart';
import 'package:riverpod_base/src/translation/app_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpPage extends StatelessWidget {
  OtpPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBarBase(
        // leading: const AppbarButtonBack(),
        middle: AppbarTitle(title: AppLocalization.of(context)!.translate('opt_authentication')),
      ),
      extendBody: true,
      floatingActionButton: FloatActionButtonNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: const CupertinoBottomBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(AppLocalization.of(context)!.translate('enter_confirm'),
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: AppSize.textBase
              ),
            ),
            SizedBox(height: 25.h,),
            Container(
              height: 48.h,
              margin: EdgeInsets.symmetric(horizontal: 40.w),
              child: OtpTextField(
                numberOfFields: 6,
                fieldWidth: 35,
                borderColor: const Color(0xFF512DA8),
                showFieldAsBox: false,
                textStyle: const TextStyle(
                  fontSize: 32,
                  color: AppColor.content,
                  fontWeight: FontWeight.w500
                ),
                focusedBorderColor: AppColor.content,
                onSubmit: (String verificationCode){
                  // _controller.verificationPhone();
                },
                onCodeChanged: (value){
                  print(value);
                  // _controller.smsCode = value;
                  if(value.length==6){
                    // _controller.activeButton.value = true;
                  }
                },// end onSubmit
              ),
            ),
            SizedBox(height: 25.h,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 40.w),
              child: CupertinoButton(
                color: AppColor.fillPositive,
                disabledColor: AppColor.content4,
                borderRadius: BorderRadius.circular(27),
                onPressed: () {  },
                child: Center(
                  child: Text(AppLocalization.of(context)!.translate('confirm'),
                    style: const TextStyle(
                        color: AppColor.content,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                ),
                      // onPressed: _controller.activeButton.value && !_controller.loading.value ? (){
                      //   _controller.verificationPhone();
                      // }: null,
              )
            )
          ],
        ),
      ),
    );
  }
}
