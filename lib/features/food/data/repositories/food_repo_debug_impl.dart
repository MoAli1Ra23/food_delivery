import 'package:food_delivery/features/food/domain/entities/food.dart';
import 'package:food_delivery/features/food/domain/repositories/food_repo.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:FoodRepo)
@Environment('debug')
class FoodRepoDebugImpl extends FoodRepo{
 
  @override
  Future<int> delete(Food food) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<Food>> getFoods() {
   return Future(() => [
    const Food(id: 0, name: "piza", imagepath:  ''),
    const Food(id: 0, name: "burger", imagepath:  ''),
    const Food(id: 0, name: "pasta", imagepath:  ''),
    const Food(id: 0, name: "Friad Checkin", imagepath:  ''),
   ]);
  }

  @override
  Future<int> insert(Food food) {
    // TODO: implement insert
    throw UnimplementedError();
  }

  @override
  Future<int> update(Food food) {
    // TODO: implement update
    throw UnimplementedError();
  }

}