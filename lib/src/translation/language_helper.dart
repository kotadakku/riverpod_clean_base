import 'package:flutter/material.dart';

class LanguageHelper{
  convertLangNameToLocale(String langNameToConvert) {
    Locale convertedLocale;

    switch (langNameToConvert) {
      case 'English':
        convertedLocale = Locale('en', 'EN');
        break;
      case 'Tiếng Việt':
        convertedLocale = Locale('vi', 'VI');
        break;
      case '中文':
        convertedLocale = Locale('zh', 'ZH');
        break;
      case 'Bahasa Malaysia':
        convertedLocale = Locale('ms', 'MS');
        break;
      default:
        convertedLocale = Locale('en', 'EN');
    }

    return convertedLocale;
  }

  convertLocaleToLangName(String localeToConvert) {
    String langName;

    switch (localeToConvert) {
      case 'en':
        langName = "English";
        break;
      case 'vi':
        langName = "Tiếng Việt";
        break;
      case 'zh':
        langName = "中文";
        break;
      case 'ms':
        langName = "Bahasa Malaysia";
        break;
      default:
        langName = "English";
    }

    return langName;
  }
}