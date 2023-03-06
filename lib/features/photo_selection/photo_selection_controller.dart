import 'package:get/get.dart';
import 'package:photoalbumtest/data/model/photo.dart';

class PhotoSelectionController extends GetxController {

  RxList<Photo> selectedPhotos = RxList();

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    if (args is List<Photo>) {
      selectedPhotos.assignAll(args);
    }
  }
}