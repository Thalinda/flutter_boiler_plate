import 'package:get/get.dart';

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          'enter_email': 'Enter email address',
          'enter_password': 'Enter password',
          'login': 'Login',
          'forgot_password': 'Forgot Password',
        },
        'es': {
          'enter_email': 'Ingrese la dirección de correo electrónico',
          'enter_password': 'Ingresa contraseña',
          'login': 'Iniciar sesión',
          'forgot_password': 'Olvidé mi contraseña',
        }
      };
}
