// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:food_delivery/shared/error/failuer.dart';

class NotMailFailure extends Failure {
  NotMailFailure(super.message);
   
   
}

class ShortPassWord extends Failure{
  ShortPassWord(super.message);

}
class  EmptyMail extends Failure{
  EmptyMail(super.message);
}class  EmptyPassWord extends Failure{
  EmptyPassWord(super.message);
}