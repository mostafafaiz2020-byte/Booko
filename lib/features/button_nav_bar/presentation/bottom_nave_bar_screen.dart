import 'package:bookia_app/core/theme/app_colors.dart';

import 'package:bookia_app/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:bookia_app/features/cart/presentation/ui/cart_screen.dart';

import 'package:bookia_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:bookia_app/features/home/presentation/ui/home_screen.dart';

import 'package:bookia_app/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:bookia_app/features/profile/presentation/ui/profile_screen.dart';
import 'package:bookia_app/features/wishlist/presentation/cubit/cubit/wishlist_cubit.dart';
import 'package:bookia_app/features/wishlist/presentation/ui/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNaveBarScreen extends StatefulWidget {
  const BottomNaveBarScreen({super.key});

  @override
  State<BottomNaveBarScreen> createState() => _BottomNaveBarScreenState();
}

class _BottomNaveBarScreenState extends State<BottomNaveBarScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CartCubit()..getCartData()),
        BlocProvider(create: (_) => WishlistCubit()..getWishlist()),
      ],
      child: Builder(
        builder: (context) {
          return Directionality(
            textDirection: TextDirection.ltr,
            child: Scaffold(
              body: IndexedStack(
                index: currentIndex,
                children: [
                  BlocProvider(
                    create: (_) => HomeCubit()
                      ..getBestSellerBooks()
                      ..getSliders(),
                    child: HomeScreen(
                      onNavigateToCart: () {
                        setState(() {
                          currentIndex = 2;
                        });
                      },
                    ),
                  ),

                  const WishlistScreen(),

                  const CartScreen(),

                  BlocProvider(
                    create: (_) => ProfileCubit()..getProfileData(),
                    child: const ProfileScreen(),
                  ),
                ],
              ),

              bottomNavigationBar: BottomNavigationBar(
                currentIndex: currentIndex,
                onTap: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                type: BottomNavigationBarType.fixed,
                backgroundColor: AppColors.backGround,
                selectedItemColor: AppColors.gold,
                items: [
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'assets/icon/Home.svg',
                      colorFilter: ColorFilter.mode(
                        currentIndex == 0 ? AppColors.gold : AppColors.black,
                        BlendMode.srcIn,
                      ),
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'assets/icon/Bookmark.svg',
                      colorFilter: ColorFilter.mode(
                        currentIndex == 1 ? AppColors.gold : AppColors.black,
                        BlendMode.srcIn,
                      ),
                    ),
                    label: 'Wishlist',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'assets/icon/cart.svg',
                      colorFilter: ColorFilter.mode(
                        currentIndex == 2 ? AppColors.gold : AppColors.black,
                        BlendMode.srcIn,
                      ),
                    ),
                    label: 'Cart',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'assets/icon/Profile.svg',
                      colorFilter: ColorFilter.mode(
                        currentIndex == 3 ? AppColors.gold : AppColors.black,
                        BlendMode.srcIn,
                      ),
                    ),
                    label: 'Profile',
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
