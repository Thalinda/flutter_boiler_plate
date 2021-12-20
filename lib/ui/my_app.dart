import 'package:boiler_plate/controller/bindings/network.dart';
import 'package:boiler_plate/lang/apptranslations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: () => GetMaterialApp(
              initialBinding: NetworkBinding(),
              translations: AppTranslation(),
              locale: Get.deviceLocale, // const Locale('es', 'ES'),
              fallbackLocale: const Locale('es', 'ES'),
              title: 'Boiler Plate',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              getPages: Routes.routes,
              initialRoute: Routes.initialRoute,
            ));
  }
}
