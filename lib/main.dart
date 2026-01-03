import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/splash/splash_bloc.dart';
import 'blocs/splash/splash_event.dart';
import 'core/routes/app_pages.dart';
import 'core/routes/app_routes.dart';
import 'core/themes/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SplashBloc()..add(StartTimer())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Random Chat',
        initialRoute: AppRoutes.splash,
        routes: AppPages.pages,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        //// TODO : MISSING TRANSLATIONS FEATURE
        locale: const Locale('en', 'US'), //// TODO : MAKE THIS FLEXIBLE
      ),
    );
  }
}
