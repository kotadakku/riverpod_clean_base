import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalization {
  AppLocalization(this.locale);

  final Locale locale;

  static AppLocalization? of(BuildContext context) {
    AppLocalization? app = Localizations.of<AppLocalization>(context, AppLocalization);
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }
  static const LocalizationsDelegate<AppLocalization> delegate =
  _AppLocalizationDelegate();

  Map<String, String> _localizedStrings = {};

  String translate(String key) {
    return _localizedStrings[key] ?? '** $key not found';
  }
  Future<bool> load() async {
    // Load the language JSON file from the "lang" folder
    String jsonString =
    await rootBundle.loadString('assets/i18n/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });

    return true;
  }

}

class _AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const _AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) =>
      ['en', 'vi', 'zh', 'ms'].contains(locale.languageCode);


  @override
  Future<AppLocalization> load(Locale locale) async {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of DemoLocalizations.
    AppLocalization localizations = new AppLocalization(locale);
    await localizations.load();
    return localizations;
  }


  @override
  bool shouldReload(_AppLocalizationDelegate old) => false;
}