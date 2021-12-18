// ignore_for_file: file_names

import 'package:boiler_plate/api/login_request.dart';
import 'package:boiler_plate/models/login.dart';
import 'package:boiler_plate/models/user.dart';
import 'package:get/get.dart';

class LoginProvider extends GetxController {
  String? email;
  String? username;
  RxBool isLoading = RxBool(false);

  Future loginToAppProvider(
    LoginModel loginModel,
  ) async {
    isLoading.value = true;
    UserModel? userModel = await loginToApp(logininfo: loginModel);
    isLoading.value = false;
    print(userModel!.toJson());
  }
}
