

import 'package:flutter/material.dart';
import 'package:food_delivery/features/menu/view/widgets/manu_item.dart';

import '../../../../shared/responsive/widget/info_widget.dart';
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

    return InfoWidget(
      builder: ( context,deviceInfo){

      return GridView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
         itemBuilder: (context, index) => SelectableMenuItem(
          item: items[index],
          onSelect: () {},
        ), gridDelegate:   SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: deviceInfo.crossAxisCount,mainAxisSpacing: 5,crossAxisSpacing: 5),
      );
  });
  }
}
