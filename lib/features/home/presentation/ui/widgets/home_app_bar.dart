import 'package:bookia/core/routes/app_routes.dart';
import 'package:bookia/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Assets.images.logo1.image(width: 99.w, height: 33.h),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.searchScreen);
          },
          child: SvgPicture.asset(Assets.icons.searchIcon),
        ),
      ],
    );
  }
}
