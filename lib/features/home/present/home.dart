import 'package:alzefr_dash/core/utils/extensions/theme_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/di/dependency_injection.dart';
import '../../categories/present/blocs/bloc/categories_bloc.dart';
import 'widgets/dashboard_nav.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, required this.child, required this.title});
  final Widget child;
  final String title;
  static const String routeName = "home";
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    getIt<CategoriesBloc>().add(.get());
  }

  @override
  Widget build(BuildContext context) {
    final canGoBack = context.canPop();
    final isWide = MediaQuery.sizeOf(context).width >= 600;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: context.textTheme.displayLarge),
        leading: canGoBack
            ? IconButton(
                tooltip: 'رجوع',
                onPressed: () {
                  return context.pop();
                },
                icon: const Icon(Icons.arrow_back),
              )
            : Padding(
                padding: .all(10.r),
                child: Icon(
                  Icons.storefront_rounded,
                  color: context.colorScheme.primary,
                ),
              ),
        actions: [
          if (!canGoBack)
            Padding(
              padding: .symmetric(horizontal: 12.w),
              child: Center(
                child: Text(
                  'لوحة التحكم',
                  style: context.textTheme.labelLarge?.copyWith(
                    color: context.colorScheme.onSurface.withValues(alpha: 0.5),
                  ),
                ),
              ),
            ),
        ],
      ),
      body: SafeArea(
        child: isWide
            ? Row(
                children: [
                  const DashboardNav(isRail: true),
                  const VerticalDivider(width: 1, thickness: 1),
                  Expanded(child: widget.child),
                ],
              )
            : widget.child,
      ),
      bottomNavigationBar: isWide || canGoBack
          ? null
          : const DashboardNav(isRail: false),
    );
  }
}
