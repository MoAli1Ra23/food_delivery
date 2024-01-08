import 'package:dartz/dartz.dart';
import 'package:food_delivery/shared/abstracts/value_object.dart';
import 'package:food_delivery/shared/error/failuer.dart';

import '../value_failures/price_failure.dart';

class Price extends ValueObject<double> {
  @override
  Either<Failure, double> value;
  factory Price(String val) {
    return Price._(validatePrice(val));
  }
  Price._(this.value) {
    if (value.isLeft()) {
      isValid = false;
      value.fold((l) => this.left = l, (r) => null);
    } else {
      isValid = true;
      value.fold((l) => null, (r) => this.right = r);
    }
  }
}

Either<Failure, double> validatePrice(String val) {
  double? s = double.tryParse(val);
  if (s == null) {
    return left(NotNumPrice(""));
  } else if (s <= 0) {
    return left(NigativeorZerorPrice(""));
  } else {
    return Right(s);
  }
}
