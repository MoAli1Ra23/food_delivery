import 'package:food_delivery/shared/error/failuer.dart';
import 'package:dartz/dartz.dart';

abstract class ValueObject<T> {
  ValueObject();
  late bool isValid;

  Either<Failure, T> get value;
  T? right;
  Failure? left;

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is ValueObject<T> && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Value($value)';
}