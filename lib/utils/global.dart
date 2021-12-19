// ignore_for_file: avoid_print

import 'package:boiler_plate/models/user.dart';
import 'package:get_storage/get_storage.dart';

class GlobalFunctions {
  Future<void> setAccessToken(String token) async {
    try {
      final box = GetStorage();
      box.write('accessToken', 'Bearer ' + token);
      print(token);
    } catch (e) {
      print(e);
    }
  }

  Future<bool> saveUser(UserModel userinfo) async {
    try {
      await setUserId(userinfo.userid.toString());
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> setUserId(String userid) async {
    try {
      final box = GetStorage();
      await box.write("userid", userid);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<String> getUserid() async {
    try {
      final box = GetStorage();
      String userid = await box.read("userid");
      return userid;
    } catch (e) {
      print(e);
      return 0.toString();
    }
  }

  Future<bool> setToken(String token) async {
    try {
      final box = GetStorage();
      await box.write("token", token);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<String> getToken() async {
    try {
      final box = GetStorage();
      String token = await box.read("token");
      return token;
    } catch (e) {
      print(e);
      return 0.toString();
    }
  }

  Future<bool> setUserName(username) async {
    try {
      final box = GetStorage();
      await box.write("username", username);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<String> getUsername() async {
    try {
      final box = GetStorage();
      String username = await box.read("username");
      return username;
    } catch (e) {
      print(e);
      return 0.toString();
    }
  }

  Future<bool> setEmail(email) async {
    try {
      final box = GetStorage();
      await box.write("email", email);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<String> getEmail() async {
    try {
      final box = GetStorage();
      String email = await box.read("email");
      return email;
    } catch (e) {
      print(e);
      return 0.toString();
    }
  }
}
