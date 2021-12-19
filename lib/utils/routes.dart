import 'package:boiler_plate/ui/home/home.dart';
import 'package:boiler_plate/ui/login/login.dart';
import 'package:boiler_plate/ui/splash/splash_screen.dart';
import 'package:get/get.dart';

class Routes {
  Routes._();

  static const String login = '/';
  static const String home = '/home';
  static const String splash = '/splash';
  static const String initialRoute = splash;
  static final routes = [
    GetPage(name: login, page: () => LoginScreen()),
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: home, page: () => const HomeScreen()),
  ];
}
