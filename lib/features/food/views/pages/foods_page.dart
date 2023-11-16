import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/food/views/cubit/cubit/foods_cubit.dart';
import 'package:food_delivery/features/food/views/widgets/food_list_item.dart';

import '../../../../shared/widgets/custom_appbar.dart';
import '../../domain/entities/food.dart';
import '../cubit/cubit/foods_state.dart';
import '../widgets/foods_list.dart';

class FoodsPage extends StatelessWidget {
  const FoodsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final w= MediaQuery.of(context).size.width;
    final h= MediaQuery.of(context).size.height;
    return SafeArea(child: Scaffold(
      // appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: h,
          child: ListView(
            
            children: [
              SizedBox(height: 90,width:w,  child: const CustomAppBar()),
              SizedBox(
                height: h-90,
                child: BlocBuilder<FoodsCubit, FoodsState>(
                  builder: (context, state) {
                    return Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(image: Image.asset(
                          'assets/images/bestfood/bf10.jpeg'
                        ).image ,fit:BoxFit.fill )
                      ),
                      child: FoodsList(foods: state.foods));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
