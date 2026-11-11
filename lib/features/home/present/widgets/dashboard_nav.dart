import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/extensions/theme_ext.dart';
import '../../../categories/present/view/widgets/categories_view.dart';
import '../../../products/present/view/products_view.dart';

class DashboardNav extends StatelessWidget {
  const DashboardNav({super.key, required this.isRail});

  final bool isRail;

  static const _destinations = [
    (
      route: ProductsView.routeName,
      label: 'المنتجات',
      icon: Icons.restaurant_menu_outlined,
      selectedIcon: Icons.restaurant_menu,
    ),
    (
      route: CategoriesView.routeName,
      label: 'التصنيفات',
      icon: Icons.category_outlined,
      selectedIcon: Icons.category,
    ),
  ];

  int _selectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).matchedLocation;
    final index = _destinations.indexWhere(
      (d) => location.startsWith('/${d.route}'),
    );
    return index < 0 ? 0 : index;
  }

  void _onSelected(BuildContext context, int index) {
    if (index == _selectedIndex(context)) {
      return;
    }
    context.goNamed(_destinations[index].route);
  }

  @override
  Widget build(BuildContext context) {
    final selected = _selectedIndex(context);
    if (isRail) {
      return NavigationRail(
        selectedIndex: selected,
        onDestinationSelected: (index) {
          return _onSelected(context, index);
        },
        labelType: .all,
        backgroundColor: context.colorScheme.surfaceContainer,
        indicatorColor: context.colorScheme.primary.withValues(alpha: 0.12),
        destinations: [
          for (final d in _destinations)
            NavigationRailDestination(
              icon: Icon(d.icon),
              selectedIcon: Icon(d.selectedIcon),
              label: Text(d.label, style: context.textTheme.labelLarge),
              padding: .symmetric(vertical: 8.h),
            ),
        ],
      );
    }
    return NavigationBar(
      selectedIndex: selected,
      onDestinationSelected: (index) {
        return _onSelected(context, index);
      },
      height: 64.h,
      labelBehavior: .alwaysShow,
      destinations: [
        for (final d in _destinations)
          NavigationDestination(
            icon: Icon(d.icon),
            selectedIcon: Icon(d.selectedIcon),
            label: d.label,
          ),
      ],
    );
  }
}