import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/menu/view/bloc/create_menu_bloc.dart';
import 'package:food_delivery/features/menu/view/bloc/select_food_bloc.dart';
import 'package:food_delivery/features/menu/view/widgets/menu_grid.dart';
import 'package:food_delivery/shared/widgets/custom_button.dart';

import '../../../../shared/widgets/custom_appbar_reusable.dart';

import 'create_menu.dart';

class SelectFoodPage extends StatelessWidget {
  const SelectFoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    final hi = MediaQuery.of(context).size.height;
    // appbar that has go back button ,title  and cart button
    // list of food with pagnation and  every
    return SafeArea(
      child: Scaffold(
        floatingActionButton: CustomButton(
            text: "new item",
            onTab: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return BlocProvider(
                  create: (context) => CreateMenuBloc(),
                  child: CreateMenu(),
                );
              }));
            }),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: ListView(
            children: [
              SizedBox(
                height: 60,
                child: CustomReusableAppBar(
                  leftIcon: const Icon(Icons.arrow_back_ios_new_rounded),
                  title: "Order",
                  titleStyle: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                  onLeftTab: () {},
                  onRightTab: () {},
                  righeIcon: const Icon(Icons.shopping_cart_checkout_rounded),
                ),
              ),
              BlocBuilder<SelectFoodBloc, SelectFoodState>(
                  builder: (context, state) {
                if (state is SelectFoodloading) {
                  return const Center(
                    child: CircularProgressIndicator(color: Colors.blue),
                  );
                } else if (state is SelectFoodloadingerror) {
                  return const Center(
                    child: Text("خطاءءءءءءءءءءءءءءءءء"),
                  );
                } else {
                  return MenuGrid(items: (state as SelectFoodInitial).items);
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
