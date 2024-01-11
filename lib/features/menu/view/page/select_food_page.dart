// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/menu/view/bloc/create_menu_bloc.dart';
import 'package:food_delivery/features/menu/view/bloc/select_food_bloc.dart';
import 'package:food_delivery/shared/widgets/custom_button.dart';

import '../../../../shared/widgets/custom_appbar_reusable.dart';
import '../../doamain/entiteis/menu_itames.dart';
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
                   return SelectableMenu(items: (state  as SelectFoodInitial).items
                   //const [
                  //   MenuItem(
                  //       imgUrl: "",
                  //       dissName: "purger",
                  //       discraption:
                  //           "hot purger and pasta and more and mores serprice",
                  //       price: 20),
                  //   MenuItem(
                  //       imgUrl: "",
                  //       dissName: "purger",
                  //       discraption:
                  //           "hot purger and pasta and more and mores serprice",
                  //       price: 20),
                  //   MenuItem(
                  //       imgUrl: "",
                  //       dissName: "purger",
                  //       discraption:
                  //           "hot purger and pasta and more and mores serprice",
                  //       price: 20),
                  //   MenuItem(
                  //       imgUrl: "",
                  //       dissName: "purger",
                  //       discraption:
                  //           "hot purger and pasta and more and mores serprice",
                  //       price: 20),
                  //   MenuItem(
                  //       imgUrl: "",
                  //       dissName: "purger",
                  //       discraption:
                  //           "hot purger and pasta and more and mores serprice",
                  //       price: 20),
                  // ]
                  );
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}

class SelectableMenu extends StatelessWidget {
  SelectableMenu({
    Key? key,
    required this.items,
  }) : super(key: key);
  final List<MenuItem> items;
  @override
  Widget build(BuildContext context) {
    // return ListView(
    //   shrinkWrap: true,
    //    scrollDirection: Axis.vertical,
    //    physics: const AlwaysScrollableScrollPhysics(),

    //   children: [
    //     for(var item in items )
    //     SelectableMenuItem(item: item ,onSelect: (){}),

    //   ],);

    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) => SelectableMenuItem(
        item: items[index],
        onSelect: () {},
      ),
    );
  }
}

class SelectableMenuItem extends StatelessWidget {
  const SelectableMenuItem({
    super.key,
    required this.item,
    this.onSelect,
  });
  final MenuItem item;
  final Function()? onSelect;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 250,
      decoration: BoxDecoration(
          color: Colors.blueGrey.shade500,
          borderRadius: const BorderRadius.horizontal(
              left: Radius.circular(25), right: Radius.circular(25))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Flexible(
              flex: 1,
              child: Image(
                image: AssetImage('assets/images/bestfood/bf1.jpeg'),
                height: 245,
              )),
          Flexible(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: onSelect,
                    child: const Icon(Icons.shopping_cart_checkout)),
                Text(
                  item.dissName,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  item.discraption,
                  style: const TextStyle(fontSize: 18),
                ),
                Text(
                  item.price.toString(),
                  style: const TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      color: Colors.pink),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
