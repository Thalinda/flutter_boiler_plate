import 'package:boiler_plate/utils/global.dart';
import 'package:boiler_plate/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String userid = "";
  @override
  void initState() {
    checkForPreviousLogin();
    super.initState();
  }

  void checkForPreviousLogin() async {
    GlobalFunctions gf = GlobalFunctions();
    userid = await gf.getUserid();
    print(userid);
    // ignore: unnecessary_null_comparison
    if (userid != "" && userid != null) {
      Get.offNamedUntil(Routes.home, (route) => false);
    } else {
      Get.offNamedUntil(Routes.login, (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Center(
          child: Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2),
            child: Center(
              child: SizedBox(
                  width: 200,
                  height: 150,
                  /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                  child: Image.asset('assets/images/logo2.png')),
            ),
          ),
        ),
        const CircularProgressIndicator()
      ],
    ));
  }
}
