// ignore_for_file: avoid_print

import 'package:boiler_plate/constants/dev_points.dart';
import 'package:boiler_plate/models/login.dart';
import 'package:boiler_plate/models/user.dart';
import 'package:boiler_plate/utils/global.dart';
import 'package:dio/dio.dart';

GlobalFunctions gf = GlobalFunctions();
Future<UserModel?> loginToApp({required LoginModel logininfo}) async {
  UserModel? retrievedUser;
  Dio _dio = Dio();

  try {
    print({
      LOGIN: LOGIN,
      "data": {
        "contact": "0711886012",
        "pwd": "121233",
        "activity": "CUSTOMER_LOGIN"
      }
    });
    Response response = await _dio.post(
      'https://gyma-api.herokuapp.com/api/customer.php',
      data: {
        "contact": "0711886012",
        "pwd": "121233",
        "activity": "CUSTOMER_LOGIN"
      },
    );

    print('User created: ${response.data['data_set']}');

    retrievedUser =
        UserModel(email: "Dummy", isMobile: true, userid: 1, token: "Dummy");
    await gf.saveUser(retrievedUser);
    return retrievedUser;
  } catch (e) {
    print('Error creating user: $e');
  }

  return retrievedUser;
}
