import 'package:flutterstore/utils/helpers/network_manager.dart';
import 'package:get/instance_manager.dart';

class GeneralBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
  }




  
}
