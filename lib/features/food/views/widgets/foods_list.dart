// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:food_delivery/features/food/domain/entities/food.dart';
import 'package:food_delivery/features/food/views/widgets/food_list_item.dart';

class FoodsList extends StatelessWidget {
  const FoodsList({
    Key? key,
    required this.foods,
  }) : super(key: key);
 
     final List<Food> foods;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
    itemCount: foods.length,
    itemBuilder: (context, index) {
      return FoodListItem(
        food: foods[index],
      );
    },
      ),
    );
  }
}
