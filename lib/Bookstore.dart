// Bookstore.dart
import 'package:bookstore/Core/routes/App_Routes.dart';
import 'package:bookstore/Core/routes/app_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookStore extends StatelessWidget {
  const BookStore({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      //ScreenUtilInit بتعمل راب علي الماتريال وتحط قبلها التلت سطور دول
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,

      child: MaterialApp(
        //localization بتحط اول 3سطور في ماتريال
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: "DM"),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,

        initialRoute: AppRoutes.welcome_screen,
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
