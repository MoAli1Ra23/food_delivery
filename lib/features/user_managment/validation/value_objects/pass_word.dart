// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:food_delivery/features/user_managment/validation/value_failure/value_failure.dart';

import 'package:food_delivery/shared/abstracts/value_object.dart';
import 'package:food_delivery/shared/error/failuer.dart';

class PassWord extends ValueObject<String> {
  @override
   Either<Failure, String>   value ;
   factory PassWord(String? s){
    return PassWord._(value: validatePassWord(s),);
   }
  PassWord._({
    required this.value,
  }){
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
Either<Failure,String> validatePassWord(String? s){
  if(s==null)
  {
    return left(ShortPassWord(""));
  }

  if (s.isEmpty ||s.length<6) {
   return left(ShortPassWord(""));
    
  }
  else {
    return right(s);
  }
}
