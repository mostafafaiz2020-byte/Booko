import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:bookia_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final cubit = context.read<HomeCubit>();
        final sliders = cubit.sliderModels?.data?.sliders ?? [];

        return Container(
          height: 150.h,
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: AppColors.gold,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: sliders.isEmpty
              ? Center(
                  child: state is GetSlidersError
                      ? const Icon(
                          Icons.image_not_supported_outlined,
                          color: Colors.white,
                          size: 50,
                        )
                      : const CircularProgressIndicator(),
                )
              : PageView.builder(
                  itemCount: sliders.length,
                  itemBuilder: (context, index) {
                    final imageUrl = sliders[index].image ?? '';

                    if (imageUrl.isEmpty) {
                      return const Center(
                        child: Icon(Icons.broken_image_outlined),
                      );
                    }

                    return Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      errorBuilder: (context, error, stackTrace) {
                        print('IMAGE ERROR: $error');
                        return const Center(
                          child: Icon(
                            Icons.broken_image_outlined,
                            color: Colors.white,
                          ),
                        );
                      },
                    );
                  },
                ),
        );
      },
    );
  }
}
