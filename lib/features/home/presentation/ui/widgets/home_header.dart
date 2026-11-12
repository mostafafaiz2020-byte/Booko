import 'package:bookia_app/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
      child: Row(
        children: [
          Image.asset('assets/image/logo.png', width: 99, height: 30),
          const Spacer(),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.searchScreen);
            },
            child: SvgPicture.asset('assets/icon/search-normal.svg'),
          ),
        ],
      ),
    );
  }
}
