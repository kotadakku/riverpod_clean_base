import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app_localization.dart';
import 'language_helper.dart';

class CurrentData extends StateNotifier<Locale> {
  String currentLanguage = 'Tiếng Việt';
  final Ref ref;

  LanguageHelper languageHelper = LanguageHelper();

  CurrentData(this.ref) : super(const Locale('vi', 'VI'));

  void changeLocale(String newLocale) async {
    Locale convertedLocale;
    currentLanguage = newLocale;
    convertedLocale = languageHelper.convertLangNameToLocale(newLocale);
    state = convertedLocale;
  }

  defineCurrentLanguage(context) {
    String definedCurrentLanguage;
    if (currentLanguage != null)
      definedCurrentLanguage = currentLanguage;
    else {
      print(
          "locale from currentData: ${Localizations.localeOf(context).toString()}");
      definedCurrentLanguage = languageHelper
          .convertLocaleToLangName(Localizations.localeOf(context).toString());
    }
    return definedCurrentLanguage;
  }
}

final currentDataProvider = StateNotifierProvider<CurrentData, Locale>((ref) {
  return CurrentData(ref);
});