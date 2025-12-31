import '../../screens/home/home_screen.dart';
import '../../screens/splash/splash_screen.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = {
    AppRoutes.splash: (context) => const SplashScreen(),
    AppRoutes.home: (context) => const HomeScreen(),
  };
}
