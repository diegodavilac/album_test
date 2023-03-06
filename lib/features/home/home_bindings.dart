import 'package:get/get.dart';
import 'package:photoalbumtest/features/home/home_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }

}