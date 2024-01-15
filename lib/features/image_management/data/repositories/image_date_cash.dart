import 'package:dartz/dartz.dart';

import 'package:food_delivery/features/image_management/domain/entities/image_cashed_data.dart';
import 'package:food_delivery/features/image_management/domain/repositories/image_data_cashed_repo.dart';

import 'package:food_delivery/shared/error/failuer.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ImageDataCasheRepo, env: ['prod', 'debug'])
class ImageDataCasheRepoImpl extends ImageDataCasheRepo {
  @override
  Future<Either<Failure, ImageCashedData>> cashImage(
      ImageCashedData imageCashedData) async {
    var box = await Hive.openBox<ImageCashedData>('Imagedata');
    var v = box.add(imageCashedData);
    return right(imageCashedData);
  }

  @override
  Future<Either<Failure, ImageCashedData>> getImageCashedDataByURL(
      String url) async {
    var box = await Hive.openBox<ImageCashedData>('Imagedata');
    ImageCashedData? s =
        box.values.where((element) => element.url == url).firstOrNull;
    if (s != null) {
      return Right(s);
    } else {
      return left(Failure(""));
    }
  }
}
