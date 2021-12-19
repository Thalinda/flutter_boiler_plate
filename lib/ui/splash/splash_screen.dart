import 'package:auto_size_text/auto_size_text.dart';
import 'package:boiler_plate/utils/connectivity.dart';
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
  int network = 0;
  @override
  void initState() {
    checkForPreviousLogin();
    super.initState();
  }

  void checkForPreviousLogin() async {
    GlobalFunctions gf = GlobalFunctions();
    var netowrkbind = Get.find<GetXNetworkManager>();
    setState(() {
      network = netowrkbind.connectionType;
    });
    if (network != 0) {
      userid = await gf.getUserid();
      // ignore: unnecessary_null_comparison
      if (userid != "" && userid != null) {
        Get.offNamedUntil(Routes.home, (route) => false);
      } else {
        Get.offNamedUntil(Routes.login, (route) => false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: network != 0
          ? Column(
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.2),
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
            )
          : Center(
              child: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.2),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/signal-satellite.png',
                      width: MediaQuery.of(context).size.width / 1.4,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    const AutoSizeText(
                      "No Interntet :( ",
                      style: TextStyle(fontSize: 30, color: Colors.blue),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: const AutoSizeText(
                        "Please Check your internet connection your internet connection is not working",
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
