import 'package:food_delivery/shared/error/failuer.dart';

class AuthFailure extends Failure {
  AuthFailure(super.message);
  
}
class ServerError extends AuthFailure{
  ServerError(super.message);
}
class EmailIsAreadyinUse extends AuthFailure{
  EmailIsAreadyinUse(super.message);
}