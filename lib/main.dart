// main.dart

import 'package:bookstore/Bookstore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void main() async {
  //EasyLocalization  بتحط اول سطرين قبل رن اب
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  //وبتحط اول تلت سطور دول قبل الشايلد  EasyLocalization بتخلي اسم الاب شايلد من ويدجيت اسمها
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      child: const BookStore(),
    ),
  );
}
