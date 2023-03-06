import 'package:get/get.dart';
import 'package:photoalbumtest/data/model/photo.dart';
import 'package:photoalbumtest/data/repository/interface/i_photo_repository.dart';

class PhotoDetailController extends GetxController {

  final IPhotoRepository _photoRepository = Get.find();

  RxBool isLoading = false.obs;
  Rx<Photo?> photo = Rx(null);
  Rx<String?> errorMessage = Rx(null);

  @override
  void onInit() {
    super.onInit();

    final argId = Get.parameters['id'] ?? '';
    final parsedId = int.tryParse(argId);
    if (parsedId != null) {
      loadPhoto(parsedId);
    } else {
      errorMessage.value = 'Invalid id';
    }
  }

  void loadPhoto(int id) async {
    isLoading.value = true;
    final result = await _photoRepository.getPhotoDetail(id);
    result.fold((l) {
      errorMessage.value = l.message;
    }, (r) {
      photo.value = r;
    });
    isLoading.value = false;
  }
}