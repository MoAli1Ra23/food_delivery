import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:food_delivery/shared/error/failuer.dart';
import 'package:food_delivery/shared/overapp/image_uploeder.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../injection.dart';
import '../../domain/repositories/image_repo.dart';

@LazySingleton(as: ImageRepo, env: ['prod', 'debug'])
class ImageRepoImpl extends ImageRepo {
  @override
  Future<Either<Failure, String>> downloadImage(String url) async {
    print("-------------------------------------------------------");

    var storage = getIt.get<FirebaseStorage>();
    print("working in  downloadImage method in Image Repo");
    print(storage.toString());

    var rr = storage.refFromURL(url);
    final appDocDir = await getApplicationDocumentsDirectory();
    print(rr);
    final ts = DateTime.now().millisecondsSinceEpoch.toString();
    final filePath = "${appDocDir.path}/images/{$ts}.jpg";
    print(appDocDir);
    var s = Directory("${appDocDir.path}/images/");
    print(s);
    final file = await File(filePath).create(recursive: true);
    print(url);
    print(rr.name);
    print(file);
    await rr.writeToFile(file).then((p0) {
      switch (p0.state) {
        case TaskState.success:
          print(" file written successfuly");

          break;
        case TaskState.canceled:
          print(" file written canceled");

          break;
        case TaskState.running:
          print(" file written running");

          break;
        case TaskState.paused:
          print(" file written Paysed");

          break;
        case TaskState.error:
          print(" file written errror");

          break;
        default:
      }

      
    });
    Future.delayed(const Duration(seconds: 2));
    print("file path: ");
    if (filePath != null) {
      return Right(filePath);
    } else {
      return left(Failure(""));
    }
  }

  @override
  Future<Either<Failure, String>> uploadeImage(
      File file, String pathInCloud) async {
    print("-------------------------------------------------------");

    String? url;
    print("working in  downloadImage method in Image Repo");
    try {
      var res = await uplodeImageAndGetURL(file: file, floder: pathInCloud);
      if (res.isLeft()) {
        print(" result is failure");
        print(res);
        return res;
      } else {
        res.fold((l) => null, (r) => url = r);
        return Right(url!);
      }
    } catch (e) {
      print("throw an exception");
      print(e.toString());
      return Left(Failure(""));
    }
  }

  @override
  Future<Either<Failure, String>> moveImagetoTheCashDistanace(
      File file, String pathInCloud) async {
    try {
      final appDocDir = await getApplicationDocumentsDirectory();

      var s = Directory("${appDocDir.path}/images/");
      var pp = await file.copy(s.path).then((value) => value.path);
      return right(pp);
    } catch (e) {
      return left(Failure("message"));
    }
  }
}
