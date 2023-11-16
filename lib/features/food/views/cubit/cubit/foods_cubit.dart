import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/food/domain/repositories/food_repo.dart';
import 'package:food_delivery/features/food/views/cubit/cubit/foods_state.dart';
import 'package:food_delivery/injection.dart';

class FoodsCubit extends Cubit<FoodsState> {
  FoodsCubit() : super(const FoodsState(foods: []));
  Future<void> onReqest() async {
    var rr=getIt.get<FoodRepo>();
    var x= await rr.getFoods();
    emit(state.copyWith(foods: x));
  }
}
