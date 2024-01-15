import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../shared/error/failuer.dart';

/// Manage download Upload Iamge to cLoud
abstract class ImageRepo {
  /// upload  file to firebase Storage  and return URl
  /// Or return   Failure
  Future<Either<Failure, String>> uploadeImage(File file, String pathInCloud);
  Future<Either<Failure, String>> moveImagetoTheCashDistanace(
      File file, String pathInCloud);

  /// download image form spcefic URL and return Loacl path or
  /// Or return   Failure
  Future<Either<Failure, String>> downloadImage(String url);
}
