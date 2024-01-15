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

Future<Either<Failure, String>> updateItemInACollection(
    Map map, String collection, String docID) async {
  try {
    var x = getIt.get<FirebaseFirestore>();
    CollectionReference collectionReference = x.collection(collection);
    String? s =
        await collectionReference.doc(docID).update(map.cast()).then((value) {
      return "1";
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
