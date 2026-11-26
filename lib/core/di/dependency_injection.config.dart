// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:dio/dio.dart' as _i361;
import 'package:event_bus/event_bus.dart' as _i1017;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:firebase_core/firebase_core.dart' as _i982;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart'
    as _i161;

import '../../config/env.dart' as _i557;
import '../../features/analytics/data/datasources/analytics_data_src.dart'
    as _i356;
import '../../features/analytics/data/datasources/analytics_firestore_data_src.dart'
    as _i816;
import '../../features/analytics/data/repo_impl/analytics_repo_impl.dart'
    as _i804;
import '../../features/analytics/domain/repo/analytics_repo.dart' as _i1033;
import '../../features/analytics/domain/usecases/analytics_use_cases.dart'
    as _i497;
import '../../features/analytics/present/bloc/analytics_bloc.dart' as _i336;
import '../../features/auth/auth/data/datasources/auth_api.dart' as _i976;
import '../../features/auth/auth/data/repo/auth_repo_impl.dart' as _i246;
import '../../features/auth/auth/domain/repo/auth_repo.dart' as _i610;
import '../../features/auth/auth/domain/usecases/auth_use_casees.dart' as _i151;
import '../../features/auth/auth/present/blocs/auth_bloc/auth_bloc.dart'
    as _i711;
import '../../features/auth/forgot_password/data/repo/forgot_password_repo_impl.dart'
    as _i877;
import '../../features/auth/forgot_password/domain/repo/forgot_pass_repo.dart'
    as _i614;
import '../../features/auth/forgot_password/domain/usecases/send_pass_reset_email_usecase.dart'
    as _i629;
import '../../features/auth/forgot_password/present/bloc/forgot_pass_bloc.dart'
    as _i154;
import '../../features/auth/reset_password/data/repo/reset_pass_repo_impl.dart'
    as _i1010;
import '../../features/auth/reset_password/domain/repo/reset_pass_repo.dart'
    as _i685;
import '../../features/auth/reset_password/domain/usecases/reset_pass_usecases.dart'
    as _i992;
import '../../features/auth/reset_password/present/bloc/reset_pass_bloc.dart'
    as _i192;
import '../../features/auth/sign_in/data/datasources/sign_in_api.dart' as _i805;
import '../../features/auth/sign_in/data/repo_impl/sign_in_repo_impl.dart'
    as _i200;
import '../../features/auth/sign_in/domain/repo/sign_in_repo.dart' as _i305;
import '../../features/auth/sign_in/domain/use_cases/sign_in_use_cases.dart'
    as _i941;
import '../../features/auth/sign_in/present/blocs/bloc/sign_in_bloc.dart'
    as _i913;
import '../../features/auth/sign_up/data/data_sources/sign_up_api.dart'
    as _i552;
import '../../features/auth/sign_up/data/repo_impl/sign_up_repo_impl.dart'
    as _i509;
import '../../features/auth/sign_up/data/services/firebase_auth_service.dart'
    as _i749;
import '../../features/auth/sign_up/domain/repo/sign_up_repo.dart' as _i871;
import '../../features/auth/sign_up/domain/use_cases/sign_up_use_cases.dart'
    as _i251;
import '../../features/auth/sign_up/present/bloc/sign_up_bloc.dart' as _i226;
import '../../features/categories/data/data_sources/categories_api.dart'
    as _i680;
import '../../features/categories/data/data_sources/categories_data_src.dart'
    as _i289;
import '../../features/categories/data/data_sources/categories_firestore_data_src.dart'
    as _i81;
import '../../features/categories/data/repo_impl/categories_repo_impl.dart'
    as _i918;
import '../../features/categories/domain/repo/categories_repo.dart' as _i66;
import '../../features/categories/domain/use_cases/categories_use_cases.dart'
    as _i900;
import '../../features/categories/present/blocs/bloc/categories_bloc.dart'
    as _i332;
import '../../features/categories/present/blocs/category_upsert_bloc/category_upsert_bloc.dart'
    as _i732;
import '../../features/home/data/data_sources/home_api.dart' as _i927;
import '../../features/home/data/data_sources/home_data_src.dart' as _i861;
import '../../features/home/data/data_sources/home_data_src_imp.dart' as _i105;
import '../../features/home/data/repo/home_repo.dart' as _i429;
import '../../features/home/domain/repo_impl/home_repo_impl.dart' as _i576;
import '../../features/home/domain/use_cases/home_use_cases.dart' as _i357;
import '../../features/home/present/bloc/home_bloc.dart' as _i481;
import '../../features/notifications/data/datasources/notifications_api.dart'
    as _i352;
import '../../features/notifications/data/repo_impl/notifications_repo_impl.dart'
    as _i666;
import '../../features/notifications/domain/repo/notifications_repo.dart'
    as _i967;
import '../../features/notifications/domain/usecases/notifications_use_cases.dart'
    as _i139;
import '../../features/notifications/present/bloc/notifications_bloc.dart'
    as _i781;
import '../../features/products/data/data_sources/products_api.dart' as _i832;
import '../../features/products/data/repo_impl/products_repo_impl.dart'
    as _i249;
import '../../features/products/domain/repo/products_repo.dart' as _i482;
import '../../features/products/domain/use_cases/products_use_cases.dart'
    as _i956;
import '../../features/products/present/blocs/bloc/products_bloc.dart' as _i340;
import '../../features/products/present/blocs/product_upsert_bloc/product_upsert_bloc.dart'
    as _i838;
import '../../features/profile/data/datasources/profile_api.dart' as _i191;
import '../../features/profile/data/repo/profile_repo_impl.dart' as _i256;
import '../../features/profile/domain/repo/profile_repo.dart' as _i364;
import '../../features/profile/domain/use_cases/profile_use_cases.dart'
    as _i995;
import '../../features/profile/present/bloc/profile_bloc.dart' as _i475;
import '../events/pusher_event_bus.dart' as _i235;
import '../networking/network_info.dart' as _i303;
import '../services/auth_storage_service.dart' as _i250;
import '../services/presigned_image_uploader.dart' as _i1053;
import '../services/pusher_service.dart' as _i41;
import '../services/token_service.dart' as _i227;
import '../session/session_manager.dart' as _i432;
import '../session/session_manager_impl.dart' as _i241;
import '../theme/theme_cubit.dart' as _i611;
import 'dio/api_module.dart' as _i158;
import 'dio/dio_module.dart' as _i374;
import 'injection_module.dart' as _i212;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt init(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(getIt, environment, environmentFilter);
  final apiModule = _$ApiModule();
  final injectionModule = _$InjectionModule();
  final dioModule = _$DioModule();
  gh.factory<_i250.AuthStorageService>(() => _i250.AuthStorageService());
  gh.singleton<_i557.Env>(() => apiModule.config);
  gh.singleton<_i158.LoggingInterceptor>(() => _i158.LoggingInterceptor());
  gh.singleton<_i158.LanguageInterceptor>(() => _i158.LanguageInterceptor());
  gh.singleton<_i1017.EventBus>(() => injectionModule.eventBus);
  gh.singleton<_i161.InternetConnection>(
    () => injectionModule.connectionChecker,
  );
  gh.singleton<_i982.FirebaseApp>(() => injectionModule.firebaseApp);
  gh.singleton<_i59.FirebaseAuth>(() => injectionModule.firebaseAuth);
  gh.singleton<_i235.PusherEventBus>(() => _i235.PusherEventBus());
  gh.singleton<_i611.ThemeCubit>(() => _i611.ThemeCubit());
  gh.lazySingleton<_i158.TokenStorage>(() => _i158.TokenStorage());
  gh.lazySingleton<_i749.FirebaseAuthService>(
    () => _i749.FirebaseAuthService(),
  );
  gh.lazySingleton<_i432.SessionManager>(() => _i241.SessionManagerImpl());
  gh.singleton<_i356.AnalyticsDataSource>(
    () => _i816.AnalyticsFirestoreDataSrc(),
  );
  gh.singleton<_i303.NetworkInfoImpl>(
    () => injectionModule.networkInfoImpl(gh<_i161.InternetConnection>()),
  );
  gh.singleton<_i289.CategoriesDataSrc>(
    () => _i81.CategoriesFirestoreDataSrc(),
  );
  gh.singleton<_i158.AuthInterceptor>(
    () => _i158.AuthInterceptor(gh<_i158.TokenStorage>()),
  );
  gh.lazySingleton<_i1033.AnalyticsRepo>(
    () => _i804.AnalyticsRepoImpl(gh<_i356.AnalyticsDataSource>()),
  );
  gh.singleton<_i497.AnalyticsUseCases>(
    () => _i497.AnalyticsUseCases(gh<_i1033.AnalyticsRepo>()),
  );
  gh.singleton<_i41.PusherService>(
    () => _i41.PusherService(gh<_i158.TokenStorage>(), gh<_i1017.EventBus>()),
  );
  gh.singleton<_i361.Dio>(
    () => dioModule.s3Dio(gh<_i158.LoggingInterceptor>()),
    instanceName: 's3Dio',
  );
  gh.singleton<_i336.AnalyticsBloc>(
    () => _i336.AnalyticsBloc(gh<_i497.AnalyticsUseCases>()),
  );
  gh.singleton<_i303.NetworkInfo>(
    () => injectionModule.networkInfo(gh<_i303.NetworkInfoImpl>()),
  );
  gh.lazySingleton<_i614.ForgotPassRepo>(
    () => _i877.ForgotPasswordRepositoryImpl(gh<_i59.FirebaseAuth>()),
  );
  gh.lazySingleton<_i685.ResetPassRepo>(
    () => _i1010.ResetPasswordRepositoryImpl(gh<_i59.FirebaseAuth>()),
  );
  gh.lazySingleton<_i227.TokenService>(
    () => _i227.TokenService(gh<_i59.FirebaseAuth>()),
  );
  gh.singleton<_i361.Dio>(
    () => dioModule.authDio(
      gh<_i158.AuthInterceptor>(),
      gh<_i158.LanguageInterceptor>(),
      gh<_i158.LoggingInterceptor>(),
    ),
    instanceName: 'authDio',
  );
  gh.lazySingleton<_i1053.PresignedImageUploader>(
    () => _i1053.PresignedImageUploader(gh<_i361.Dio>(instanceName: 's3Dio')),
  );
  gh.singleton<_i361.Dio>(
    () => dioModule.dio(
      gh<_i158.AuthInterceptor>(),
      gh<_i158.LanguageInterceptor>(),
      gh<_i158.LoggingInterceptor>(),
    ),
  );
  gh.lazySingleton<_i992.ResetPassUseCases>(
    () => _i992.ResetPassUseCases(gh<_i685.ResetPassRepo>()),
  );
  gh.lazySingleton<_i832.ProductsApi>(() => _i832.ProductsApi(gh<_i361.Dio>()));
  gh.lazySingleton<_i191.ProfileApi>(() => _i191.ProfileApi(gh<_i361.Dio>()));
  gh.singleton<_i680.CategoriesApi>(() => _i680.CategoriesApi(gh<_i361.Dio>()));
  gh.singleton<_i927.HomeApi>(() => _i927.HomeApi(gh<_i361.Dio>()));
  gh.singleton<_i352.NotificationsApi>(
    () => _i352.NotificationsApi(gh<_i361.Dio>()),
  );
  gh.singleton<_i976.AuthApi>(
    () => _i976.AuthApi(gh<_i361.Dio>(instanceName: 'authDio')),
  );
  gh.lazySingleton<_i805.SignInApi>(
    () => _i805.SignInApi(gh<_i361.Dio>(instanceName: 'authDio')),
  );
  gh.lazySingleton<_i552.SignUpApi>(
    () => _i552.SignUpApi(gh<_i361.Dio>(instanceName: 'authDio')),
  );
  gh.factory<_i629.SendPassResetEmailUseCase>(
    () => _i629.SendPassResetEmailUseCase(gh<_i614.ForgotPassRepo>()),
  );
  gh.singleton<_i967.NotificationsRepo>(
    () => _i666.NotificationsRepoImpl(gh<_i352.NotificationsApi>()),
  );
  gh.factory<_i154.ForgotPassBloc>(
    () => _i154.ForgotPassBloc(gh<_i629.SendPassResetEmailUseCase>()),
  );
  gh.lazySingleton<_i192.ResetPassBloc>(
    () => _i192.ResetPassBloc(gh<_i992.ResetPassUseCases>()),
  );
  gh.lazySingleton<_i364.ProfileRepo>(
    () =>
        _i256.ProfileRepoImpl(gh<_i191.ProfileApi>(), gh<_i59.FirebaseAuth>()),
  );
  gh.lazySingleton<_i871.SignUpRepo>(
    () => _i509.SignUpRepoImpl(
      gh<_i227.TokenService>(),
      gh<_i749.FirebaseAuthService>(),
      gh<_i552.SignUpApi>(),
    ),
  );
  gh.singleton<_i861.HomeDataSrc>(
    () => _i105.HomeDataSrcImpl(api: gh<_i927.HomeApi>()),
  );
  gh.singleton<_i66.CategoriesRepo>(
    () => _i918.CategoriesRepoImpl(
      gh<_i680.CategoriesApi>(),
      gh<_i289.CategoriesDataSrc>(),
      gh<_i1053.PresignedImageUploader>(),
    ),
  );
  gh.lazySingleton<_i995.ProfileUseCases>(
    () => _i995.ProfileUseCases(gh<_i364.ProfileRepo>()),
  );
  gh.lazySingleton<_i251.SignUpUseCases>(
    () => _i251.SignUpUseCases(gh<_i871.SignUpRepo>()),
  );
  gh.singleton<_i475.ProfileBloc>(
    () => _i475.ProfileBloc(gh<_i995.ProfileUseCases>()),
  );
  gh.singleton<_i610.AuthRepo>(
    () => _i246.AuthRepoImpl(
      gh<_i59.FirebaseAuth>(),
      gh<_i976.AuthApi>(),
      gh<_i227.TokenService>(),
      gh<_i250.AuthStorageService>(),
    ),
  );
  gh.lazySingleton<_i482.ProductsRepo>(
    () => _i249.ProductsRepoImpl(
      gh<_i832.ProductsApi>(),
      gh<_i1053.PresignedImageUploader>(),
    ),
  );
  gh.singleton<_i139.NotificationsUseCases>(
    () => _i139.NotificationsUseCases(gh<_i967.NotificationsRepo>()),
  );
  gh.singleton<_i900.CategoriesUseCases>(
    () => _i900.CategoriesUseCases(categoriesRepo: gh<_i66.CategoriesRepo>()),
  );
  gh.singleton<_i956.ProductsUseCase>(
    () => _i956.ProductsUseCase(productsRepo: gh<_i482.ProductsRepo>()),
  );
  gh.lazySingleton<_i226.SignUpBloc>(
    () => _i226.SignUpBloc(signUpUseCases: gh<_i251.SignUpUseCases>()),
  );
  gh.singleton<_i332.CategoriesBloc>(
    () => _i332.CategoriesBloc(
      categoriesUseCases: gh<_i900.CategoriesUseCases>(),
    ),
  );
  gh.lazySingleton<_i732.CategoryUpsertBloc>(
    () => _i732.CategoryUpsertBloc(
      categoriesUseCases: gh<_i900.CategoriesUseCases>(),
    ),
  );
  gh.lazySingleton<_i305.SignInRepo>(
    () => _i200.SignInRepoImpl(
      gh<_i749.FirebaseAuthService>(),
      gh<_i610.AuthRepo>(),
      gh<_i805.SignInApi>(),
    ),
  );
  gh.singleton<_i340.ProductsBloc>(
    () => _i340.ProductsBloc(useCases: gh<_i956.ProductsUseCase>()),
  );
  gh.lazySingleton<_i838.ProductUpsertBloc>(
    () =>
        _i838.ProductUpsertBloc(productsUseCases: gh<_i956.ProductsUseCase>()),
  );
  gh.singleton<_i781.NotificationsBloc>(
    () => _i781.NotificationsBloc(gh<_i139.NotificationsUseCases>()),
  );
  gh.singleton<_i429.HomeRepo>(
    () => _i576.HomeRepoImpl(gh<_i861.HomeDataSrc>()),
  );
  gh.singleton<_i151.AuthUseCases>(
    () => _i151.AuthUseCases(authRepo: gh<_i610.AuthRepo>()),
  );
  gh.singleton<_i357.HomeUseCases>(
    () => _i357.HomeUseCases(homeRepo: gh<_i429.HomeRepo>()),
  );
  gh.lazySingleton<_i941.SignInUseCases>(
    () => _i941.SignInUseCases(gh<_i305.SignInRepo>()),
  );
  gh.singleton<_i711.AuthBloc>(() => _i711.AuthBloc(gh<_i151.AuthUseCases>()));
  gh.lazySingleton<_i913.SignInBloc>(
    () => _i913.SignInBloc(signInUseCases: gh<_i941.SignInUseCases>()),
  );
  gh.singleton<_i481.HomeBloc>(
    () => _i481.HomeBloc(homeUseCases: gh<_i357.HomeUseCases>()),
  );
  return getIt;
}

class _$ApiModule extends _i158.ApiModule {}

class _$InjectionModule extends _i212.InjectionModule {}

class _$DioModule extends _i374.DioModule {}
