import 'package:get/get.dart';

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          'enter_email': 'Enter email address',
          'enter_password': 'Enter password',
          'login': 'Login',
          'forgot_password': 'Forgot Password',
          'notvalid': 'Not valid Email',
          "emailnot_valid": "Email is not valid",
          "passwordnote_valide": "Password is not valid",
          "email": "Email",
          "email_address": "Email Address",
          "password": "Password",
        },
        'es': {
          'enter_email': 'Ingrese la dirección de correo electrónico',
          'enter_password': 'Ingresa contraseña',
          'login': 'Iniciar sesión',
          'forgot_password': 'Olvidé mi contraseña',
          'notvalid': 'dirección de correo electrónico no válida',
          "emailnot_valid": "El correo no es válido",
          "passwordnote_valide": "La contraseña no es válida",
          "email": "Correo electrónico",
          "email_address": "Dirección de correo electrónico",
          "password": "Contraseña",
        }
      };
}
