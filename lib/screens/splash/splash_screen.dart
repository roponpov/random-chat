import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/splash/splash_bloc.dart';
import '../../blocs/splash/splash_state.dart';
import '../../core/constants/app_image_constant.dart';
import '../../core/routes/app_routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc,SplashState>(
      listener: (context, state) {
        if(state is SplashNavigated) {
          Navigator.pushReplacementNamed(context, AppRoutes.home);
        }
      },
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: DecoratedBox(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImageConstant.primaryBackground),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Column(
                spacing: 8,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppImageConstant.splashLogo,
                    width: MediaQuery.of(context).size.width / 2.5,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Random Chat',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Anonymous. Instant. Safe.',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontWeight: FontWeight.normal,
                    ),
                  ),

                ],
              ),
            ),
          ),
        )
    );
  }

}