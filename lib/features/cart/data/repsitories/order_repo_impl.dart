import 'package:dartz/dartz.dart';

import 'package:food_delivery/features/cart/domain/entities/order.dart'
    as ordrt;

import 'package:food_delivery/shared/error/failuer.dart';

import '../../../../shared/overapp/fire_store.dart';
import '../../domain/repositories/order_repo.dart';

class OrderRepoImpl extends OrderRepo {
  @override
  Future<Either<Failure, List<ordrt.Order>>> fechOrdrrByState(String state) {
    // TODO: implement fechOrdrrByState
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ordrt.Order>>> fechOrdrrByUserID(String id) {
    // TODO: implement fechOrdrrByUserID
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> insertOrder(ordrt.Order order) {
    return insertItemInACollectinio(order.toMap(), "ordrs");
  }

  @override
  Future<Either<Failure, String>> updateOrder(ordrt.Order order, String docID) {
    return updateItemInACollectinio(order.toMap(), "ordrs", docID);
  }
}
