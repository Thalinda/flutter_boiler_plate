// ignore_for_file: avoid_print

import 'package:boiler_plate/constants/dev_points.dart';
import 'package:boiler_plate/models/login.dart';
import 'package:boiler_plate/models/user.dart';
import 'package:dio/dio.dart';

Future<UserModel?> loginToApp({required LoginModel logininfo}) async {
  UserModel? retrievedUser;
  Dio _dio = Dio();

  try {
    Response response = await _dio.post(
      LOGIN,
      data: {
        "contact": "0711886012",
        "pwd": "121233",
        "activity": "CUSTOMER_LOGIN"
      },
    );

    print('User created: ${response.data}');

    retrievedUser =
        UserModel(email: "Dummy", isMobile: true, userid: 1, token: "Dummy");
  } catch (e) {
    print('Error creating user: $e');
  }

  return retrievedUser;
}
