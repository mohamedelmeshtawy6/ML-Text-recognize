import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mesht_ocr/features/home/presentation/controller/cubit/cubit/hometext_cubit.dart';
import 'package:mesht_ocr/features/home/presentation/controller/cubit/home_cubit.dart';
import 'package:mesht_ocr/features/home/presentation/home_view.dart';
import 'package:mesht_ocr/splash._view.dart';

class AppRouter {
  static const String splashview = '/';
  static const String homeview = '/home';

  static final route = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => SplashView(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(create: (context)=>HomeCubit()),
            BlocProvider(create: (context)=>HometextCubit()),
            
            ], child: const HomeView()),
    ),
  ]);
}
