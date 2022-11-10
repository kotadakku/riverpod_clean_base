
import 'package:riverpod_base/src/presentation/view/theme/theme.dart';
import 'package:riverpod_base/src/translation/app_localization.dart';
import 'package:riverpod_base/src/utils/validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'dropdown_lang_widget.dart';

class PhoneFieldWidget extends StatelessWidget {
  PhoneFieldWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      child: TextFormField(
        obscureText: false,
        cursorHeight: 18.h,
        autocorrect: false,
        autofocus: false,
        keyboardType: TextInputType.phone,
        // controller: _controller.textEditingController,
        autovalidateMode: AutovalidateMode.disabled,
        style: const TextStyle(
            color: AppColor.content
        ),
        onSaved: (value){
        },
        validator: (value) => Validator().validatorPhone(value),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white.withOpacity(0.8),
          hintText: AppLocalization.of(context)!.translate('phone'),
          hintStyle: const TextStyle(
            color: AppColor.content3,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 5.0.h, horizontal: 10.w),
          prefixIcon: DropdownLangWidget(),
          prefixIconConstraints: const BoxConstraints(
              maxWidth: 100
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
    );
  }
}
