import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:food_delivery/features/cart/domain/entities/order.dart'
    as ordrt;
import 'package:food_delivery/injection.dart';
import 'package:food_delivery/shared/error/connection_failure.dart';
import 'package:food_delivery/shared/error/failuer.dart';
import 'package:food_delivery/shared/overapp/connection_cheacker.dart';
import 'package:injectable/injectable.dart';
import '../../../../shared/overapp/fire_store.dart';
import '../../domain/repositories/order_repo.dart';
@LazySingleton(as: OrderRepo, env: ['prod', 'debug'])

class OrderRepoImpl extends OrderRepo {
  @override
  Future<Either<Failure, List<ordrt.Order>>> fechOrdrrByState(
      String state) async {
    return await _fechOrdrrByField("state", state).then((value) => value);
  }

  @override
  Future<Either<Failure, List<ordrt.Order>>> fechOrdrrByUserID(
      String id) async {
    return await _fechOrdrrByField("userId", id).then((value) => value);
  }

  @override
  Future<Either<Failure, String>> insertOrder(ordrt.Order order) {
    return insertItemInACollectinio(order.toMap(), "ordrs");
  }

  @override
  Future<Either<Failure, String>> updateOrder(ordrt.Order order, String docID) {
    return updateItemInACollection(order.toMap(), "ordrs", docID);
  }

/// privte method to dont  rewrite qurey
  Future<Either<Failure, List<ordrt.Order>>> _fechOrdrrByField(
      String field, String comparingValue) async {
    var co = await checkConnection();
    if (co.isLeft()) {
      return Left(co.fold((l) => l, (r) => ConnectionsFailure(" ")));
    }
    List<ordrt.Order> orders = [];
    var firestore = getIt.get<FirebaseFirestore>();
    try {
      var query = await firestore
          .collection("order")
          .where(field, isEqualTo: comparingValue)
          .get()
          .then((value) => value);
      for (var doc in query.docs) {
        ordrt.Order x = ordrt.Order.fromMap(doc.data());
        orders.add(x);
      }
      return right(orders);
    } catch (e) {
      return left(Failure(""));
    }
  }
}
