import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:food_delivery/injection.dart';

import '../error/failuer.dart';

Future<Either<Failure, String>> uplodeImageAndGetURL(
    {required String floder, required File file, String? subFolder}) async {
  var storage = getIt.get<FirebaseStorage>();
  try {
    print("begin uploade");
    Reference ref = storage.ref().child(floder);
    print(" get ref");

    String ts = DateTime.now().millisecondsSinceEpoch.toString();
    print(" set file name");

    var url = await ref.child("$ts.jpg").putFile(file).then(
          (p0) async => await p0.ref.getDownloadURL(),
        );
    print("url:$url");

    return right(url);
  } catch (e) {
    return left(Failure(e.toString()));
  }
}
