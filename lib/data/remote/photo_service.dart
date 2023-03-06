import 'package:dio/dio.dart';
import 'package:photoalbumtest/data/model/photo.dart';
import 'package:retrofit/http.dart';

part 'photo_service.g.dart';

@RestApi()
abstract class PhotoService {
  factory PhotoService(Dio dio) => _PhotoService(dio);

  @GET('/photos')
  Future<List<Photo>> getPhotos(
    @Query('_limit') int limit,
    @Query('_start') int start,
  );

  @GET('/photos/{id}')
  Future<Photo> getPhotoDetail(
    @Path('id') int id,
  );
}
