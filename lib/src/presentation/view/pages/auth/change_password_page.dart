

import 'package:riverpod_base/src/presentation/view/theme/theme.dart';
import 'package:riverpod_base/src/presentation/view/widgets/widgets.dart';
import 'package:riverpod_base/src/translation/app_localization.dart';
import 'package:riverpod_base/src/utils/validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ChangePasswordPage extends StatelessWidget {
  ChangePasswordPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBarBase(

        leading: const AppbarButtonBack(),
        middle: AppbarTitle(title: AppLocalization.of(context)!.translate('change_password')),
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
          child: Form(
            // key: _controller.formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 190.h,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 40.w),

                  child: TextFormField(
                    // obscureText: _controller.isObscurePassword.value,
                    cursorHeight: 18.h,
                    // controller: _controller.newPassController,
                    autovalidateMode: AutovalidateMode.disabled,
                    style: const TextStyle(
                        color: AppColor.content
                    ),
                    onSaved: (value){
                    },
                    validator: (value) => Validator().validatorPassword(value),
                    onChanged: (value){

                    },
                    onTap: (){

                    },

                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8),
                      hintText: AppLocalization.of(context)!.translate('new_password'),
                      hintStyle: const TextStyle(
                        color: AppColor.content3,
                      ),

                      contentPadding: EdgeInsets.symmetric(vertical: 15.0.h, horizontal: 10.w),
                      prefixIcon: Padding(
                          padding: EdgeInsets.only(left: 16.w, right: 5.w),
                          child: SvgPicture.asset("assets/icons/ic_lock.svg",
                          )
                      ),
                      prefixIconConstraints: BoxConstraints(
                          maxHeight: 18.h
                      ),
                      suffixIcon: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: (){
                          // _controller.isObscurePassword.value = !_controller.isObscurePassword.value;
                        },
                        child: Padding(
                          padding: EdgeInsets.only(right: 16.w),
                          child: SvgPicture.asset("assets/icons/ic_eye.svg",
                              // color: _controller.isObscurePassword.value? AppColor.content3 : AppColor.fillPositive

                          ),
                        ),
                      ),
                      suffixIconConstraints: BoxConstraints(
                          maxHeight: 29.h
                      ),

                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(27)
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(27)
                      ),
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(27)
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(27)
                      ),
                      errorStyle: const TextStyle(
                        color: AppColor.accent2,
                      ),
                      isDense: true,
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(27)
                      ),
                    ),

                  )
                ),
                SizedBox(height: 16.h,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 40.w),

                  child: TextFormField(
                    // obscureText: _controller.isObscureConfirmPassword.value,
                    cursorHeight: 18.h,
                    cursorColor: AppColor.content,
                    autovalidateMode: AutovalidateMode.disabled,
                    style: const TextStyle(
                        color: AppColor.content
                    ),
                    onSaved: (value){
                    },

                    onChanged: (value){

                    },
                    // validator: (value) => Validator().validatorConfirmPassword(_controller.newPassController.text, value),
                    onTap: (){

                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8),
                      hintText: AppLocalization.of(context)!.translate('enter_again_password'),
                      hintStyle: const TextStyle(
                        color: AppColor.content3,
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 15.0.h, horizontal: 10.w),
                      prefixIcon: Padding(
                          padding: EdgeInsets.only(left: 16.w, right: 5.w),
                          child: SvgPicture.asset("assets/icons/ic_lock.svg")
                      ),
                      prefixIconConstraints: BoxConstraints(
                          maxHeight: 18.h
                      ),
                      suffixIcon: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: (){
                          // _controller.isObscureConfirmPassword.value = ! _controller.isObscureConfirmPassword.value;
                        },
                        child: Padding(
                          padding: EdgeInsets.only(right: 16.w),
                          child: SvgPicture.asset("assets/icons/ic_eye.svg",
                              // color: _controller.isObscureConfirmPassword.value? AppColor.content3 : AppColor.fillPositive
                          ),
                        ),
                      ),
                      suffixIconConstraints: BoxConstraints(
                          maxHeight: 29.h
                      ),

                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(27)
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(27)
                      ),
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(27)
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(27)
                      ),
                      errorStyle: const TextStyle(
                        color: AppColor.accent2,
                      ),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(27)
                      ),
                    ),

                  ),
                ),
                SizedBox(height: 16.h,),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 40.w),
                  child: CupertinoButton(
                      color: AppColor.fillPositive,
                      borderRadius: BorderRadius.circular(27),
                      child: Center(
                        child: Text(AppLocalization.of(context)!.translate('confirm'),
                          style: const TextStyle(
                              color: AppColor.content,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                      onPressed: (){
                        // _controller.changePassword();
                      }),
                )
              ],
            ),
          ),
        )
      )
    );
  }
}
