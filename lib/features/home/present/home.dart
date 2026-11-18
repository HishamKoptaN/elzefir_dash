import 'package:alzefr_dash/core/utils/extensions/theme_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/di/dependency_injection.dart';
import '../../categories/present/blocs/bloc/categories_bloc.dart';
import '../../notifications/present/bloc/notifications_bloc.dart';
import '../../notifications/present/view/notifications_view.dart';
import '../../profile/present/views/profile_view.dart';
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
    getIt<NotificationsBloc>().add(const .watch());
  }

  Widget _rootTitle(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40.r,
          height: 40.r,
          decoration: BoxDecoration(
            color: context.colorScheme.primary.withValues(alpha: 0.1),
            borderRadius: .circular(12.r),
          ),
          child: Icon(
            Icons.storefront_rounded,
            color: context.colorScheme.primary,
            size: 22.r,
          ),
        ),
        SizedBox(width: 10.w),
        Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .start,
          children: [
            Text(
              'لوحة التحكم',
              style: context.textTheme.titleLarge?.copyWith(
                color: context.colorScheme.primary,
              ),
            ),
            Text(
              'أسماك الزفر البحرية',
              style: context.textTheme.labelSmall?.copyWith(
                color: context.colorScheme.onSurface.withValues(alpha: 0.55),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final canGoBack = context.canPop();
    final isWide = MediaQuery.sizeOf(context).width >= 600;
    return Scaffold(
      appBar: AppBar(
        title: canGoBack
            ? Text(
                widget.title,
                style: context.textTheme.titleLarge?.copyWith(
                  color: context.colorScheme.onSurface,
                ),
              )
            : _rootTitle(context),
        leading: canGoBack
            ? IconButton(
                tooltip: 'رجوع',
                onPressed: () {
                  return context.pop();
                },
                icon: const Icon(Icons.arrow_back),
              )
            : null,
        actions: [
          if (!canGoBack) ...[
            BlocBuilder<NotificationsBloc, NotificationsState>(
              bloc: getIt<NotificationsBloc>(),
              builder: (context, state) {
                final unread = state.mapOrNull(
                          loaded: (s) {
                            return s.unreadCount;
                          },
                        ) ??
                        0;
                return IconButton(
                  tooltip: 'الإشعارات',
                  onPressed: () {
                    context.pushNamed(NotificationsView.routeName);
                  },
                  icon: Badge.count(
                    count: unread,
                    isLabelVisible: unread > 0,
                    child: const Icon(Icons.notifications_none_rounded),
                  ),
                );
              },
            ),
            IconButton(
              tooltip: 'الملف الشخصي',
              onPressed: () {
                context.pushNamed(ProfileView.routeName);
              },
              icon: const Icon(Icons.person_outline_rounded),
            ),
            SizedBox(width: 4.w),
          ],
        ],
      ),
      body: SafeArea(
        child: isWide
            ? Row(
                children: [
                  const DashboardNav(isRail: true),
                  VerticalDivider(
                    width: 1,
                    thickness: 1,
                    color: context.colorScheme.outline,
                  ),
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
