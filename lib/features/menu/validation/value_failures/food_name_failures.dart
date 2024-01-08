import 'package:food_delivery/shared/error/failuer.dart';

class NullFoodName extends Failure{
  NullFoodName(super.message);

}
class ShortFoodName extends Failure{
  ShortFoodName(super.message);

}