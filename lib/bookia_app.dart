import 'package:bookia/core/routes/app_router.dart';
import 'package:bookia/core/routes/app_routes.dart';
import 'package:bookia/core/services/locale/locale_helper.dart';
import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/core/utils/app_constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookiaApp extends StatelessWidget {
  const BookiaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: ThemeData(
          fontFamily: 'DM',
          scaffoldBackgroundColor: AppColors.bgColor,
        ),
        initialRoute: initPage(),
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }

  String initPage() {
    if (LocaleHerper.prefs?.getString(AppConstants.userToken) != null) {
      return AppRoutes.bottonNavBarScreen;
    } else {
      return AppRoutes.welcomeScreen;
    }
  }
}
