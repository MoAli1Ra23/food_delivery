// import 'package:dartz/dartz.dart';

import 'package:dartz/dartz.dart';

import '../../../../shared/error/failuer.dart';
import '../entities/order.dart'as order ;

abstract class OrderRepo {
  Future<Either<Failure, String>>updateOrder(order.Order order,String docID);
  Future<Either<Failure, String>>insertOrder(order.Order order);
 ///to get for custorm himslef  to show him his orders
 ///reqard its state
 Future<Either<Failure, List<order.Order >>> fechOrdrrByUserID(String id);
/// to get orders list basd on its State and u can use it to admains or deliver
/// or restrunt managers to get orders as the went to show
/// 

 Future<Either<Failure, List<order.Order >>> fechOrdrrByState(String state);
 

}