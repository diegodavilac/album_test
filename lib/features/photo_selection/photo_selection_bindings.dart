import 'package:get/get.dart';
import 'package:photoalbumtest/features/photo_selection/photo_selection_controller.dart';

class PhotoSelectionBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(PhotoSelectionController());
  }

}