import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:photoalbumtest/core/common/app_service.dart';
import 'package:photoalbumtest/data/remote/photo_service.dart';
import 'package:photoalbumtest/data/repository/interface/i_photo_repository.dart';
import 'package:photoalbumtest/data/repository/photo_repository.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<Dio>(
      Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com/'))
      ..interceptors.add(PrettyDioLogger()),
      permanent: true,
    );

    Get.put<PhotoService>(PhotoService(Get.find<Dio>()), permanent: true);

    Get.put<IPhotoRepository>(PhotoRepository(photoService: Get.find()),
        permanent: true);

    Get.put(
      AppService(),
      permanent: true,
    );
  }
}
