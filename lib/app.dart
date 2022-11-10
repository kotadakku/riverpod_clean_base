import 'package:riverpod_base/src/presentation/view/pages/home_view.dart';
import 'package:riverpod_base/src/presentation/view/pages/pages.dart';
import 'package:riverpod_base/src/routes/app_router.dart';
import 'package:riverpod_base/src/translation/current_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'src/translation/app_localization.dart';

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent
    ));
    final currentDataController = ref.watch(currentDataProvider);
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context) => MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: (settings) => AppRouter.onGenerateRoute(settings),
          title: 'Flutter Demo',
          localeResolutionCallback: (locale, supportedLocales) {
            // Check if the current device locale is supported
            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale?.languageCode ||
                  supportedLocale.countryCode == locale?.countryCode) {

                return supportedLocale;
              }
            }
            // If the locale of the device is not supported, use the first one
            // from the list (English, in this case).
            return supportedLocales.first;
          },

          locale: currentDataController,
          localizationsDelegates: const [
            AppLocalization.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate
          ],
          supportedLocales: const [
            Locale('en'),
            Locale('vi'),
            Locale('zh'),
            Locale('ms'),
          ],
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const ControlPage(),
        )

    ) ;
  }
}


