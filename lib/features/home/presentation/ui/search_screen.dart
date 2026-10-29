import 'package:bookia/core/widgets/arrow_back.dart';
import 'package:bookia/core/widgets/custom_text_form_feild.dart';
import 'package:bookia/features/home/data/model/books_model.dart';
import 'package:bookia/features/home/presentation/cubit/home_cubit.dart';
import 'package:bookia/features/home/presentation/ui/widgets/book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 19.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              11.verticalSpace,
              ArrowBack(),
              24.verticalSpace,
              CustomTextFormFeild(
                hintText: "Search Store",
                isSearch: true,
                autofocus: true,
                onChanged: (value) {
                  context.read<HomeCubit>().search(value ?? "");
                },
              ),
              33.verticalSpace,
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is SearchLoading) {
                    return Expanded(
                      child: Skeletonizer(
                        enabled: true,
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: .565,
                                mainAxisSpacing: 14.h,
                                crossAxisSpacing: 18.w,
                              ),
                          itemBuilder: ((context, index) => BookItem(
                            product: Products(
                              name: "flutter",

                              price: "122",
                              image:
                                  "https://i.pinimg.com/736x/a7/23/92/a7239282a9231a2eae2fd5be2116df28.jpg",
                            ),
                          )),
                          itemCount: 6,
                        ),
                      ),
                    );
                  } else if (state is SearchSuccess) {
                    return Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: .565,
                          mainAxisSpacing: 14.h,
                          crossAxisSpacing: 18.w,
                        ),
                        itemBuilder: ((context, index) =>
                            BookItem(product: state.products?[index])),
                        itemCount: state.products?.length,
                      ),
                    );
                  } else {
                    return Center(child: Text("Data is Empty"));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
