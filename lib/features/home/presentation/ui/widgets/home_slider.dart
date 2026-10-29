import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/features/home/presentation/cubit/home_cubit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({super.key});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is SlidersLoading ||
          current is SlidersSuccess ||
          current is SlidersError,
      builder: (context, state) {
        if (state is SlidersSuccess) {
          final sliders = state.slider ?? [];
          if (sliders.isEmpty) return const SizedBox.shrink();

          return Column(
            children: [
              CarouselSlider.builder(
                itemCount: sliders.length,
                itemBuilder: (context, index, realIndex) {
                  return _SliderImage(url: sliders[index].image);
                },
                options: CarouselOptions(
                  height: 150.h,
                  viewportFraction: 1,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 600),
                  onPageChanged: (index, reason) {
                    setState(() => currentIndex = index);
                  },
                ),
              ),
              SizedBox(height: 12.h),
              DotsIndicator(
                dotsCount: sliders.length,
                position: currentIndex.toDouble(),
                decorator: DotsDecorator(
                  color: const Color(0xFFD9D9D9),
                  activeColor: AppColors.primaryColor,
                  size: Size.square(6.r),
                  activeSize: Size(24.w, 6.r),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  spacing: EdgeInsets.symmetric(horizontal: 3.w),
                ),
              ),
            ],
          );
        }

        if (state is SlidersLoading) {
          return Skeletonizer(
            enabled: true,
            child: Column(
              children: [
                Container(
                  height: 150.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                SizedBox(height: 12.h),
                DotsIndicator(
                  dotsCount: 3,
                  position: 0,
                  decorator: DotsDecorator(
                    color: Colors.grey,
                    activeColor: Colors.grey,

                    size: Size.square(6.r),
                    activeSize: Size(24.w, 6.r),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        return Center(child: Text("Error"));
      },
    );
  }
}

class _SliderImage extends StatelessWidget {
  const _SliderImage({required this.url});

  final String? url;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.r),
      child: Image.network(
        url ?? '',
        width: double.infinity,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, progress) {
          if (progress == null) return child;
          return Container(color: Colors.grey.shade200);
        },
        errorBuilder: (context, error, stackTrace) => Container(
          color: Colors.grey.shade200,
          child: const Icon(Icons.broken_image_outlined),
        ),
      ),
    );
  }
}
