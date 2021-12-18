import 'package:boiler_plate/ui/login/login.dart';
import 'package:get/get.dart';

class Routes {
  Routes._();

  static const String login = '/login';
  static const String home = '/home';
  static const String initialRoute = '/login';
  static final routes = [GetPage(name: login, page: () => LoginScreen())];
}
