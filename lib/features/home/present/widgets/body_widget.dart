import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/di/dependency_injection.dart';
import '../bloc/home_bloc.dart';
import 'about/about.dart';
import 'categories_nav.dart';
import 'footer/footer_widget.dart';
import '../../../products/present/view/products_widget.dart';

class BodyWidget extends StatefulWidget {
  const BodyWidget({super.key});
  @override
  State<BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  final offerWidget = GlobalKey();
  final categoriesKey = GlobalKey();
  final productsKey = GlobalKey();
  final additionsKey = GlobalKey();
  final aboutKey = GlobalKey();
  final contactKey = GlobalKey();
  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context == null) return;
    Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: BlocBuilder<HomeBloc, HomeState>(
          bloc: getIt<HomeBloc>(),
          builder: (context, state) {
            return state.maybeMap(
              loaded: (state) {
                return Column(
                  crossAxisAlignment: .center,
                  spacing: 24.h,
                  children: [
                    // RestaurantAppBar(
                    //   onHome: () {
                    //     scrollToSection(productsKey);
                    //   },
                    //   onMenu: () {
                    //     scrollToSection(categoriesKey);
                    //   },
                    //   onAbout: () {
                    //     scrollToSection(aboutKey);
                    //   },
                    //   onContact: () {
                    //     scrollToSection(contactKey);
                    //   },
                    // ),
                    CategoriesNav(
                      key: categoriesKey,
                      categories: state.homeRes?.categories ?? [],
                      selectedCategoryId: state.selectedCategoryId,
                      onChanged: (categoryId) {
                        getIt<HomeBloc>().add(
                          .selectCategoryId(id: categoryId),
                        );
                      },
                    ),
                    ProductsWidget(
                      key: productsKey,
                      products: state.homeRes?.products ?? [],
                      shrinkWrap: true,
                    ),
                    AboutSection(key: aboutKey),
                    FooterWidget(key: contactKey),
                  ],
                );
              },
              orElse: () {
                return SizedBox();
              },
            );
          },
        ),
      ),
    );
  }
}
