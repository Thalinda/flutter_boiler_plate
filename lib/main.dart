import 'package:boiler_plate/controller/pushnotification_controller.dart';
import 'package:boiler_plate/ui/my_app.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FCMController().initialize();

  await GetStorage.init();
  runApp(const MyApp());
}
