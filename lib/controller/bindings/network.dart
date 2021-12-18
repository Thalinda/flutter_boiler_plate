import 'package:boiler_plate/utils/connectivity.dart';
import 'package:get/get.dart';

class NetworkBinding extends Bindings {
  // dependence injection attach our class.
  @override
  void dependencies() {
    Get.lazyPut<GetXNetworkManager>(() => GetXNetworkManager());
  }
}
