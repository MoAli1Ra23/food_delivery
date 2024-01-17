import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/shared/widgets/image_perviewer.dart';

import '../../../image_management/view/bloc/manage_image_bloc.dart';
import '../../../image_management/view/widgets/manage_image_widget.dart';
import '../../doamain/entiteis/menu_itames.dart';

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
            Flexible(
            flex: 1,
            child: BlocProvider(
                create: (context) => ManageImageBloc()
                  ..add(ImageSettingEvent(
                      collction: "",
                       tempImage: const Image(
                          image: AssetImage('assets/images/bestfood/bf3.jpeg')),
                      url: item.imgUrl,  )),
                child: const ManageImageWidget(),
              ),
            // child: Image(
            //   image: AssetImage('assets/images/bestfood/bf1.jpeg'),
            //   height: 245,
            // ),
          ),
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
