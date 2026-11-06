import 'package:alzefr_dash/core/utils/extensions/theme_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../core/di/dependency_injection.dart';
import '../../categories/present/blocs/bloc/categories_bloc.dart';
import '../../categories/present/view/widgets/categories_view.dart';
import '../../products/present/view/products_view.dart';
import 'bloc/home_bloc.dart';

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
    getIt<HomeBloc>().add(HomeEvent.get());
    getIt<CategoriesBloc>().add(CategoriesEvent.get());
  }

  @override
  Widget build(BuildContext context) {
    final canGoBack = context.canPop();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title, style: context.textTheme.displayLarge),
          leading: !canGoBack
              ? null
              : IconButton(
                  onPressed: () {
                    if (canGoBack) {
                      context.pop();
                    } else {
                      Scaffold.of(context).openDrawer();
                    }
                  },
                  icon: Icon(canGoBack ? Icons.arrow_back : Icons.menu),
                ),
        ),

        drawer: canGoBack
            ? null
            : Drawer(
                width: 200.w,
                child: Column(
                  children: [
                    UserAccountsDrawerHeader(
                      accountName: Text('أحمد محمد'),
                      accountEmail: Text(' [EMAIL_ADDRESS]'),
                      currentAccountPicture: CircleAvatar(
                        child: Icon(Icons.person, size: 48.r),
                      ),
                      decoration: BoxDecoration(
                        color: context.colorScheme.primary,
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        context.goNamed(ProductsView.routeName);
                      },
                      leading: Icon(Icons.shopping_cart),
                      title: Text('المنتجات'),
                    ),
                    ListTile(
                      onTap: () {
                        context.goNamed(CategoriesView.routeName);
                      },
                      leading: Icon(Icons.category),
                      title: Text('التصنيفات'),
                    ),

                    ListTile(
                      onTap: () {
                        context.goNamed(ProductsView.routeName);
                      },
                      leading: Icon(Icons.settings),
                      title: Text('الإعدادات'),
                    ),
                  ],
                ),
              ),

        body: widget.child,
      ),
    );
  }
}
