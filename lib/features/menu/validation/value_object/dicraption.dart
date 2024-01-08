import 'package:dartz/dartz.dart';
import 'package:food_delivery/shared/abstracts/value_object.dart';
import 'package:food_delivery/shared/error/failuer.dart';

import '../value_failures/dicraption_failures.dart';
  
class Discraption extends ValueObject<String> {
  @override
  Either<Failure, String> value;
  factory Discraption(String val) {
    return Discraption._(validatedicraption(val));
  }
  Discraption._(this.value) {
    if (value.isLeft()) {
      isValid = false;
      value.fold((l) => this.left = l, (r) => null);
    } else {
      isValid = true;
      value.fold((l) => null, (r) => this.right = r);
    }
  }
}

Either<Failure, String>validatedicraption(String s) {
  
  if (s.isEmpty) {
    return left(NullDicraption(""));
  } else if (s.length <= 1) {
    return left(ShortDicraption(""));
  } else {
    return Right(s);
  }
}
