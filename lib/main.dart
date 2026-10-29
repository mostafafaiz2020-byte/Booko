import 'package:bookia/bookia_app.dart';
import 'package:bookia/core/networking/dio_factory.dart';
import 'package:bookia/core/services/locale/locale_helper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await LocaleHerper.init();
  DioFactory.init();

  // LocaleHerper.prefs?.clear();

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),

      child: BookiaApp(),
    ),
  );
}
