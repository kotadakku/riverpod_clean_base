import 'package:riverpod_base/src/presentation/view/theme/theme.dart';
import 'package:riverpod_base/src/translation/current_data.dart';
import 'package:riverpod_base/src/translation/language_helper.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';


class AppbarDropdownButton extends ConsumerWidget {
  AppbarDropdownButton({Key? key}) : super(key: key);

  List<int> _getDividersIndexes(items) {
    List<int> _dividersIndexes = [];
    for (var i = 0; i < (items.length * 2) - 1; i++) {
      if (i.isOdd) {
        _dividersIndexes.add(i);
      }
    }
    return _dividersIndexes;
  }
  List<DropdownMenuItem<String>> _addDividersAfterItems(List<dynamic> items, Locale locale) {
    List<DropdownMenuItem<String>> _menuItems = [];
    for (var item in items) {
      if(item == locale.languageCode){
        _menuItems.insertAll(0,
          [
            DropdownMenuItem<String>(
              value: item,
              child: Container(
                height: 50.h,
                padding: const EdgeInsets.symmetric(vertical: 5),
                alignment: Alignment.center,
                color: AppColor.accent,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset("assets/images/${item}.png",),
                  ],
                ),
              )
            ),
            const DropdownMenuItem<String>(
              enabled: false,
              child: Divider(
                height: 1,
              ),
            ),
          ],
        );
        continue;
      }
      _menuItems.addAll(
        [
          DropdownMenuItem<String>(
            value: item,
            child: Container(
              height: 50.h,
              padding: const EdgeInsets.symmetric(vertical: 5),
              alignment: Alignment.center,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset("assets/images/${item}.png",),
                ],
              ),
            )
          ),
          const DropdownMenuItem<String>(
            enabled: false,
            child: Divider(
              height: 1,
            ),
          ),
        ],
      );
    }
    _menuItems.removeLast();
    return _menuItems;
  }
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Locale lang = ref.watch(currentDataProvider);
    
    return DropdownButton2(
      isExpanded: true,
      items:_addDividersAfterItems(['en', 'vi', 'zh', 'ms'], lang),
      onChanged: (value) async {
        LanguageHelper languageHelper = LanguageHelper();
        String langName = (languageHelper.convertLocaleToLangName(value as String)) as String;
        ref.read(currentDataProvider.notifier).changeLocale(langName);
      },
      hint: Image.asset('assets/images/${lang.languageCode}.png',
        height: 28.h,
      ),
      icon: Container(
        height: 16,
        width: 16,
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
        child: SvgPicture.asset('assets/icons/ic_chevron_down.svg',
          color: AppColor.content2,
          height: 4,
          width: 8,
        ),
      ),
      style: TextStyle(
          color: AppColor.content2,
          fontSize: AppSize.textBase,
          fontWeight: FontWeight.w600
      ),
      buttonHeight: 24,
      buttonWidth: 44.w,
      buttonPadding: const EdgeInsets.all(2),
      dropdownElevation: 1,
      underline: const SizedBox(),
      dropdownWidth: 30.h,
      itemHeight: 30,
      customItemsIndexes: _getDividersIndexes(['en', 'vi', 'zh', 'ms']),
      customItemsHeight: 1,
      itemPadding: const EdgeInsets.only(left: 0, bottom: 0, top: 0, right: 0),
      dropdownPadding: const EdgeInsets.only(left: 0, bottom: 0, top: 0, right: 0),
      buttonDecoration: BoxDecoration(
          color: AppColor.backgroundSecondary,
          borderRadius: BorderRadius.circular(5.0)
      ),
      dropdownDecoration: BoxDecoration(
          color: AppColor.backgroundLight,
          borderRadius: BorderRadius.circular(5.0)
      ),
      buttonElevation: 0,

      scrollbarRadius: const Radius.circular(40),
      scrollbarThickness: 6,
      offset: const Offset(0, -10),
    );
  }
}
