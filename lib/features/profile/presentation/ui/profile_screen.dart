import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widgets/profile_header.dart';
import 'widgets/profile_user_info.dart';
import 'widgets/profile_menu_item.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              ProfileHeader(),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      16.verticalSpace,
                      ProfileUserInfo(),
                      35.verticalSpace,
                      ProfileMenuItem(title: 'My Orders', onTap: () {}),
                      ProfileMenuItem(title: 'Edit Profile', onTap: () {}),
                      ProfileMenuItem(title: 'Reset Password', onTap: () {}),
                      ProfileMenuItem(title: 'FAQ', onTap: () {}),
                      ProfileMenuItem(title: 'Contact Us', onTap: () {}),
                      ProfileMenuItem(title: 'Privacy & Terms', onTap: () {}),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
{
    "data": {
        "id": 978,
        "name": "Ahmed Abdelsattar",
        "email": "ahmedabdelsattar@gmail.com",
        "address": null,
        "city": null,
        "phone": null,
        "email_verified": true,
        "image": "https://codingarabic.eraapro.com/admin/assets/img/default/user.jpg"
    },
    "message": "",
    "error": [],
    "status": 200
}
*/
