import 'package:dartz/dartz.dart';
import 'package:food_delivery/shared/abstracts/value_object.dart';
import 'package:food_delivery/shared/error/failuer.dart';

class RestrauntName extends ValueObject<String> {
  @override
  Either<Failure, String> value;
  factory RestrauntName(String s) {
    return RestrauntName._(validateRestrauntName(s));
  }

  RestrauntName._(this.value) {
    if (value.isLeft()) {
      isValid = false;
      value.fold((l) => this.left = l, (r) => null);
    } else {
      isValid = true;
      value.fold((l) => null, (r) => this.right = r);
    }
  }
}

Either<Failure, String> validateRestrauntName(String value) {
  if (value.isEmpty) {
    return left(Failure("empty"));
  } else {
    return right(value);
  }
}
