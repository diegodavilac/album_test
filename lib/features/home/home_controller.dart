import 'package:get/get.dart';
import 'package:photoalbumtest/data/model/photo.dart';
import 'package:photoalbumtest/data/repository/interface/i_photo_repository.dart';

class HomeController extends GetxController {
  RxBool isLoading = false.obs;
  bool listEnded = false;
  RxBool selectionMode = false.obs;
  int page = 0;
  RxList<Photo> photos = RxList();
  RxList<Photo> selectedPhotos = RxList();

  final IPhotoRepository _photoRepository = Get.find<IPhotoRepository>();

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  void loadData() {
    isLoading.value = true;
    _photoRepository.getPhotos(page).then((result) {
      //TODO: validate if it's network to retry call
      result.fold((l) {
        isLoading.value = false;
      }, (r) {
        photos.addAll(r);
        isLoading.value = false;
      });
    });
  }
}
