import 'package:dartz/dartz.dart';

import 'package:food_delivery/shared/error/failuer.dart';

import '../../../../shared/abstracts/value_object.dart';
import '../value_failure/value_failure.dart';

class EmailAddress extends ValueObject<String> {
  @override
  Either<Failure, String> value;

  factory EmailAddress(String? input) {
    return EmailAddress._(
      validateMail(input),
    );
  }
  EmailAddress._(this.value) {
    if (value.isLeft()) {
      isValid=false;
      value.fold((l) => this.left=l, (r) => null);
      
    }
    else{
      isValid=true;
      value.fold((l) => null , (r) =>this.right=r );
    }
  }
}

Either<Failure, String> validateMail(String? s) {
  if(s==null)
  {
    return left(ShortPassWord(""));
  }
  const emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  if (RegExp(emailRegex).hasMatch(s)) {
    return right(s);
  } else {
    return left(NotMailFailure( s));
  }
}
