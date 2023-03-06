import 'package:get/get.dart';
import 'package:photoalbumtest/features/photo_detail/photo_detail_controller.dart';

class PhotoDetailBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(PhotoDetailController());
  }

}