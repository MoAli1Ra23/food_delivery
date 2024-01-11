import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:food_delivery/shared/error/failuer.dart';

import '../../injection.dart';

Future<Either<Failure, String>> insertItemInACollectinio(
    Map map, String collection) async {
  try {
    var x = getIt.get<FirebaseFirestore>();
    CollectionReference collectionReference = x.collection(collection);
     String? s = await collectionReference.add(map).then((value) {
      return value.id;
    });
    if (s != null) {
      return right(s);
    } else {
      return left(Failure(""));
    }
  } catch (e) {
    return left(Failure(""));
  }
}
