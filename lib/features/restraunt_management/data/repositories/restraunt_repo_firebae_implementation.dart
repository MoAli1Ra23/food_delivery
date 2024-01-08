import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import 'package:food_delivery/features/restraunt_management/domain/entities/restraunt.dart';
import 'package:food_delivery/injection.dart';

import 'package:food_delivery/shared/error/failuer.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositoies/restraunt_repo.dart';

@LazySingleton(as: RestrauntRepo,env: ['prod','debug'])

class RestrauntRepoFirebaseImplementation extends RestrauntRepo {
  @override
  Future<Either<Failure, List<Restraunt>>> allRestruants() {
    // TODO: implement allRestruants
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, int>> delete(Restraunt r) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, int>> insert(Restraunt r) async {
     try {
      FirebaseFirestore store = getIt.get<FirebaseFirestore>();
      DocumentReference re =
          await store.collection("Restraunts").add(r.toMap());
      return right(1);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> update(Restraunt r)  {
    throw UnimplementedError();
   
  }

  @override
  Future<Either<Failure, Restraunt>> getRestruntbyUserID(String userid) async {
    try {
      FirebaseFirestore store = getIt.get<FirebaseFirestore>();
      QuerySnapshot<Map<String, dynamic>> s = await store
          .collection("Restraunts")
          .where("userID", isEqualTo: userid)
          .get();
      if (s.docs.isEmpty) {
        // todo :select spcefic Failure
        return left(Failure(""));
      } else {
        Restraunt r = Restraunt.fromMap(s.docs.first.data());
        return right(r);
      }
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
