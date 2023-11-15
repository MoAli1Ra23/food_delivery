import 'package:food_delivery/features/food/domain/entities/food.dart';

abstract class FoodRepo {
  Future<List<Food>> getFoods();
  Future<int> insert(Food food);
  Future<int> delete(Food food);
  Future<int> update(Food food);
  
}