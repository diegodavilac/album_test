import 'package:dartz/dartz.dart';
import 'package:photoalbumtest/core/model/failure.dart';
import 'package:photoalbumtest/data/model/photo.dart';

abstract class IPhotoRepository {
  Future<Either<Failure, List<Photo>>> getPhotos(int start);

  Future<Either<Failure, Photo>> getPhotoDetail(int id);
}