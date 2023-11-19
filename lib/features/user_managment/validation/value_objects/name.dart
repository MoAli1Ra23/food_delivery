// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import 'package:food_delivery/features/user_managment/validation/value_failure/value_failure.dart';
import 'package:food_delivery/shared/abstracts/value_object.dart';
import 'package:food_delivery/shared/error/failuer.dart';

class Name extends ValueObject<String> {
  @override
  Either<Failure, String> value;
  factory Name(String s) {
    return Name._(value: validateName(s));
  }
  Name._({
    required this.value,
  }) {
    if (value.isLeft()) {
      isValid = false;
      value.fold((l) => this.left = l, (r) => null);
    } else {
      isValid = true;
      value.fold((l) => null, (r) => this.right = r);
    }
  }
}

Either<Failure, String> validateName(String? s) {
  if (s == null) {
    return left(NullName(""));
  }
  if (s.isEmpty || s.length < 2) {
    return left(EmptyORShortName(""));
  } else {
    return right(s);
  }
}
