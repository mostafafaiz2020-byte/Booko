import 'package:bookia_app/bookia_app.dart';
import 'package:bookia_app/core/networking/dio_factory.dart';
import 'package:bookia_app/core/services/locale/local_helper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  LocalHelper.inti();
  DioFactory.inti();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      startLocale: const Locale('ar'),
      child: BookiaApp(),
    ),
  );
}
