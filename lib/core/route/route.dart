import 'package:flutter/material.dart';
import '../../presentation/screens/home/home_screen.dart';
import '../../presentation/screens/login/login_screen.dart';
import '../../presentation/screens/notification/notification_screen.dart';
import '../../presentation/screens/splash/splash_screen.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.routeName:
        return _materialRoute(const SplashScreen(), SplashScreen.routeName);

      case LoginScreen.routeName:
        return _materialRoute(const LoginScreen(), LoginScreen.routeName);

      case HomeScreen.routeName:
        return _materialRoute(const HomeScreen(), HomeScreen.routeName);

      case NotificationScreen.routeName:
        return _materialRoute(const NotificationScreen(), NotificationScreen.routeName);

      default:
      // If there is no such named route in the switch statement, e.g. /third
        return _materialRoute(
            const Scaffold(
              body: SafeArea(
                child: Center(
                  child: Text('Route Error'),
                ),
              ),
            ),
            '404');
    }
  }

  static Route<dynamic> _materialRoute(Widget view, String routeName) {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => view,
    );
  }
}
