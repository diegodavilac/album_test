import 'package:dio/dio.dart';
import 'package:photoalbumtest/core/model/failure.dart';
import 'package:photoalbumtest/data/model/photo.dart';
import 'package:photoalbumtest/data/remote/photo_service.dart';
import 'package:dartz/dartz.dart';
import 'package:photoalbumtest/data/repository/interface/i_photo_repository.dart';

class PhotoRepository extends IPhotoRepository{

  static const PAGE_SIZE = 20;

  PhotoRepository({
    required this.photoService,
  });

  final PhotoService photoService;

  Future<Either<Failure, List<Photo>>> getPhotos(int page) async {
    try {
      final result = await photoService.getPhotos(PAGE_SIZE, page * PAGE_SIZE);
      return Right(result);
    } catch (e) {
      if (e is DioError) {
        return Left(NetworkFailure(
          message: e.response?.statusMessage,
          errorCode: e.response?.statusCode
        ));
      } else {
        return Left(GeneralFailure(
          message: e.toString(),
        ));
      }
    }
  }

  Future<Either<Failure, Photo>> getPhotoDetail(int id) async {
    try {
      final result = await photoService.getPhotoDetail(id);
      return Right(result);
    } catch (e) {
      if (e is DioError) {
        return Left(NetworkFailure(
            message: e.response?.statusMessage,
            errorCode: e.response?.statusCode
        ));
      } else {
        return Left(GeneralFailure(
          message: e.toString(),
        ));
      }
    }
  }
}
