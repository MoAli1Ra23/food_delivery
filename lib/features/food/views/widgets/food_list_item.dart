// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:food_delivery/features/food/domain/entities/food.dart';

class FoodListItem extends StatelessWidget {
  const FoodListItem({
    Key? key,
    required this.food,
  }) : super(key: key);
  final Food food;
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3),
      decoration: BoxDecoration(
              color: Colors.blueGrey.shade100,

          // border: Border.all(),
           borderRadius: BorderRadius.circular(18)),
      child: Row(
        children: [
          SizedBox(
              width: w * .29,
              child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(18),
                      bottomLeft: Radius.circular(18)),
                  child: Image.asset("assets/images/bestfood/bf10.jpeg"))),
          Container(
            constraints: BoxConstraints(maxWidth: w * .6),
            width: w * 0.7,
            child: Column(
              children: [
                Text(
                  food.name,
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: w * .6),
                  child: const Text(
                    "foof is the best love for my haert and stomeck",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
