import 'package:dartz/dartz.dart';
import 'package:food_delivery/shared/abstracts/value_object.dart';
import 'package:food_delivery/shared/error/failuer.dart';

import '../value_failures/food_name_failures.dart';
 
class FoodName extends ValueObject<String> {
  @override
  Either<Failure, String> value;
  factory FoodName(String val) {
    return FoodName._(validateFoodName(val));
  }
  FoodName._(this.value) {
    if (value.isLeft()) {
      isValid = false;
      value.fold((l) => this.left = l, (r) => null);
    } else {
      isValid = true;
      value.fold((l) => null, (r) => this.right = r);
    }
  }
}

Either<Failure, String>validateFoodName(String s) {
  
  if (s.isEmpty) {
    return left(NullFoodName(""));
  } else if (s.length <= 1) {
    return left(ShortFoodName(""));
  } else {
    return Right(s);
  }
}
