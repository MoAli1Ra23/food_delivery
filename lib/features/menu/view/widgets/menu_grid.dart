import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/menu/view/widgets/manu_item.dart';

import '../../../../shared/responsive/widget/info_widget.dart';
import '../../../cart/view/bloc/cart_bloc.dart';
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

    return InfoWidget(builder: (context, deviceInfo, {grdlanrgh= 125}) {
      return GridView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: const ClampingScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) => SelectableMenuItem(
          item: items[index],
          onSelect: () {
            BlocProvider.of<CartBloc>(context)
                .add(AddCartItemEvent(items[index]));
          },
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: deviceInfo.crossAxisCount,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5),
      );
    });
  }
}
