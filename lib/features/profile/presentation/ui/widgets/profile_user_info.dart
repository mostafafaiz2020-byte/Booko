import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:bookia_app/core/theme/app_text_style.dart';
import 'package:bookia_app/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileUserInfo extends StatelessWidget {
  const ProfileUserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is GetProfileLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is GetProfileSucsess) {
          final profile = state.profileData;
          final imageUrl = profile?.image ?? '';

          return Row(
            children: [
              CircleAvatar(
                radius: 40.r,
                backgroundColor: AppColors.backGround,
                backgroundImage: imageUrl.isNotEmpty
                    ? NetworkImage(imageUrl)
                    : null,
                child: imageUrl.isEmpty
                    ? Icon(Icons.person, size: 40.r, color: AppColors.gray80)
                    : null,
              ),
              13.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      profile?.name ?? 'No name',
                      style: AppTextStyles.dmRegular20.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                    6.verticalSpace,
                    Text(
                      profile?.email ?? 'No email',
                      style: AppTextStyles.dmRegular14.copyWith(
                        color: AppColors.gray80,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }

        if (state is GetProfileError) {
          return const Center(
            child: Text('Failed to load profile information'),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
