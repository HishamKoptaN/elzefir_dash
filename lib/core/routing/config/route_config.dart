import 'package:alzefr_dash/features/products/present/view/products_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../features/auth/auth/present/views/auth_view.dart';
import '../../../features/auth/forgot_password/present/views/forgot_pass_view.dart';
import '../../../features/auth/sign_in/otp_view.dart';
import '../../../features/auth/sign_in/present/views/phone_sign_in_view.dart';
import '../../../features/auth/sign_in/present/views/sign_in_view.dart';
import '../../../features/auth/sign_up/present/views/email_view.dart';
import '../../../features/auth/sign_up/present/views/sign_up_view.dart';
import '../../../features/auth/reset_password/present/views/reset_pass_view.dart';
import '../../../features/categories/domain/entities/categories_res_entity.dart';
import '../../../features/categories/present/view/upsert_category_view.dart';
import '../../../features/categories/present/view/widgets/categories_view.dart';
import '../../../features/home/present/home.dart';
import '../../../features/home/present/restaurant_page_view.dart';
import '../../../features/products/domain/entities/product_entity.dart';
import '../../../features/products/present/view/upsert_product_view.dart';
import '../../../features/working_hours/present/view/working_hours_view.dart';
import '../../utils/extensions/theme_ext.dart';
import '../app_route.dart';
import '../middlewares/guards/app_guards.dart';

class RouteConfig {
  static List<RouteBase> get routes {
    return [
      appRoute(
        name: 'loading',
        path: '/loading',
        builder: (context, state) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: context.colorScheme.primary,
              ),
            ),
          );
        },
      ),
      appRoute(
        name: AuthView.routeName,
        path: '/${AuthView.routeName}',
        builder: (context, state) {
          return const AuthView();
        },
      ),
      appRoute(
        name: SignInView.routeName,
        path: '/${SignInView.routeName}',
        builder: (context, state) {
          return const SignInView();
        },
      ),
      appRoute(
        name: PhoneSignInView.routeName,
        path: '/${PhoneSignInView.routeName}',
        builder: (context, state) {
          return const PhoneSignInView();
        },
      ),
      appRoute(
        name: OtpView.routeName,
        path: '/${OtpView.routeName}',
        builder: (context, state) {
          return const OtpView();
        },
      ),
      appRoute(
        name: ForgotPassView.routeName,
        path: '/${ForgotPassView.routeName}',
        builder: (context, state) {
          return const ForgotPassView();
        },
      ),
      appRoute(
        name: ResetPassView.routeName,
        path: '/${ResetPassView.routeName}',
        builder: (context, state) {
          return const ResetPassView();
        },
      ),
      appRoute(
        name: RestaurantPageView.routeName,
        path: '/${RestaurantPageView.routeName}',
        builder: (context, state) {
          return const RestaurantPageView();
        },
      ),
      appRoute(
        name: SignUpView.routeName,
        path: '/${SignUpView.routeName}',
        builder: (context, state) {
          return const SignUpView();
        },
      ),
      appRoute(
        name: VerifyEmailView.routeName,
        path: '/${VerifyEmailView.routeName}',
        guards: AppGuards.authenticated,
        builder: (context, state) {
          return const VerifyEmailView();
        },
      ),
      ShellRoute(
        builder: (context, state, child) {
          return HomeView(
            title: _getPageTitle(state: state),
            child: child,
          );
        },
        routes: [
          appRoute(
            name: ProductsView.routeName,
            path: '/${ProductsView.routeName}',
            builder: (context, state) {
              return const ProductsView();
            },
            routes: [
              appRoute(
                name: UpsertProductView.routeName,
                path: UpsertProductView.routeName,
                builder: (context, state) {
                  return UpsertProductView(
                    product: state.extra as ProductEntity?,
                  );
                },
              ),
            ],
          ),
          appRoute(
            name: WorkingHoursView.routeName,
            path: '/${WorkingHoursView.routeName}',
            builder: (context, state) {
              return const WorkingHoursView();
            },
          ),
          appRoute(
            name: CategoriesView.routeName,
            path: '/${CategoriesView.routeName}',
            builder: (context, state) {
              return CategoriesView();
            },
            routes: [
              appRoute(
                name: UpsertCategoryView.routeName,
                path: 'upsert',
                builder: (context, state) {
                  return UpsertCategoryView(
                    category: state.extra as CategoryEntity?,
                  );
                },
              ),
            ],
          ),
        ],
      ),
    ];
  }

  static String _getPageTitle({required GoRouterState state}) {
    switch (state.matchedLocation) {
      case '/products':
        return 'المنتجات';
      case '/products/upsert':
        return state.extra == null ? 'إضافة منتج جديد' : 'تعديل منتج';
      case '/categories':
        return 'التصنيفات';
      case '/categories/upsert':
        return state.extra == null ? 'إضافة تصنيف جديد' : 'تعديل تصنيف';
      case '/working-hours':
        return 'ساعات العمل';

      default:
        return '';
    }
  }
}
