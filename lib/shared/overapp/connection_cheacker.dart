import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:food_delivery/injection.dart';

import '../error/failuer.dart';

Future<Either<Failure,None>> checkConnection() async {
  var x=getIt.get<Connectivity>();
  if(await x.checkConnectivity()==ConnectivityResult.none){
    return Left(Failure(""));
  }
  else{
    return right(const None());
  }
}
