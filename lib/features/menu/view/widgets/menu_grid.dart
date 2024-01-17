

import 'package:flutter/material.dart';
import 'package:food_delivery/features/menu/view/widgets/manu_item.dart';

import '../../doamain/entiteis/menu_itames.dart';

class MenuGrid extends StatelessWidget {
  const MenuGrid({
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

    return GridView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) => SelectableMenuItem(
        item: items[index],
        onSelect: () {},
      ), gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    );
  }
}
