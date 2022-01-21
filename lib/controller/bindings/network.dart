import 'package:boiler_plate/utils/connectivity.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NetworkBinding extends Bindings {
  // dependence injection attach our class.
  @override
  void dependencies() {
    Get.lazyPut<GetXNetworkManager>(() => GetXNetworkManager());
  }
}

Future checkNetworkStatus(BuildContext context) async {
  bool status = false;

  try {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile) {
      status = true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      status = true;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Sending Message"),
      ));
    }
  } catch (e) {
    print(e);
  }

  return status;
}