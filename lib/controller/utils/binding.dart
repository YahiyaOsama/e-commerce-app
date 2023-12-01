import 'package:get/get.dart';
import 'package:purchases/controller/home_controller.dart';
import '../auth_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.put(HomeController());
  }
}
