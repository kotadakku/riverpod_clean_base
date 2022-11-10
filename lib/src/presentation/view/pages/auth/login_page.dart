
import 'package:riverpod_base/src/presentation/controller/auth/login_controller.dart';
import 'package:riverpod_base/src/presentation/view/theme/theme.dart';
import 'package:riverpod_base/src/translation/app_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

final obscurePasswordProvider = StateProvider<bool>((ref) => true);

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController phoneTextController = TextEditingController();
    final TextEditingController passwordTextController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey();
    final isObscurePassword = ref.watch(obscurePasswordProvider);
    final isLoading = ref.watch(loadingProvider);

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 189.h,
                    ),
                    Image.asset("assets/images/logo.png",
                      width: 242.w,
                    ),
                    SizedBox(
                      height: 80.h,
                    ),
                    Container(
                      height: 48.h,
                      margin: EdgeInsets.symmetric(horizontal: 40.w),

                      child: TextFormField(
                        obscureText: false,
                        cursorHeight: 18.h,
                        controller: phoneTextController,
                        autovalidateMode: AutovalidateMode.disabled,
                        style: const TextStyle(
                            color: AppColor.content
                        ),
                        onSaved: (value){
                        },
                        validator: (value){

                        },
                        onChanged: (value){

                        },
                        onTap: (){

                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.8),
                          hintText: AppLocalization.of(context)!.translate('phone'),
                          hintStyle: const TextStyle(
                            color: AppColor.content3,
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 5.0.h, horizontal: 10.w),
                          prefixIcon: Padding(
                              padding: EdgeInsets.only(left: 16.w, right: 5.w),
                              child: SvgPicture.asset("assets/icons/ic_phone.svg")
                          ),
                          prefixIconConstraints: BoxConstraints(
                              maxHeight: 18.h
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
                      height: 48.h,
                      margin: EdgeInsets.symmetric(horizontal: 40.w),

                      child: TextFormField(
                        obscureText: isObscurePassword,
                        cursorHeight: 18.h,
                        controller: passwordTextController,
                        autovalidateMode: AutovalidateMode.disabled,
                        style: const TextStyle(
                            color: AppColor.content
                        ),
                        onSaved: (value){
                        },
                        validator: (value){

                        },
                        onChanged: (value){

                        },
                        onTap: (){

                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.8),
                          hintText: AppLocalization.of(context)!.translate('enter_password'),
                          hintStyle: const TextStyle(
                            color: AppColor.content3,
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 5.0.h, horizontal: 10.w),
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
                              ref.read(obscurePasswordProvider.notifier).state = !ref.read(obscurePasswordProvider.notifier).state;
                            },
                            child: Padding(
                              padding: EdgeInsets.only(right: 16.w),
                              child: SvgPicture.asset("assets/icons/ic_eye.svg",
                                color: isObscurePassword? AppColor.content2 : AppColor.fillPositive,

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
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 40.w),
                      alignment: Alignment.centerRight,
                      child: Text(AppLocalization.of(context)!.translate('forget_password'),
                        style: TextStyle(
                            color: AppColor.content3,
                            fontSize: AppSize.textXs
                        ),
                      ),
                    ),
                    SizedBox(height: 35.h,),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 40.w),
                      child: CupertinoButton(
                          color: AppColor.fillPositive,
                          borderRadius: BorderRadius.circular(27),
                          child: Center(
                            child: Text(AppLocalization.of(context)!.translate('login'),
                              style: const TextStyle(
                                  color: AppColor.content,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                          onPressed: (){
                            if(formKey.currentState!.validate()){
                              ref.read(loginControllerProvider.notifier).login(
                                username: phoneTextController.text,
                                password: passwordTextController.text,
                                context: context
                              );
                            }
                          }),
                    ),

                  ],
                ),
              ),

              isLoading ? const Center(
                child: CircularProgressIndicator.adaptive(),
              ) : const SizedBox()
            ],
          ),
        )
      ),
    );
  }
}
