import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/responsive/widget/info_widget.dart';
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
    return InfoWidget(builder: (context, deviceInfo) {
      return Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          height: deviceInfo.loaclheight,
          decoration: const BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(25), right: Radius.circular(25))),
          // child: Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //       Flexible(
          //       flex: 1,
          //       child: BlocProvider(
          //           create: (context) => ManageImageBloc()
          //             ..add(ImageSettingEvent(
          //                 collction: "",
          //                  tempImage: const Image(
          //                     image: AssetImage('assets/images/bestfood/bf3.jpeg')),
          //                 url: item.imgUrl,  )),
          //           child: const ManageImageWidget(),
          //         ),

          //     ),
          //     SizedBox(
          //       width:deviceInfo.localwith/2 ,
          //        child: Column(
          //         mainAxisSize: MainAxisSize.max,

          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         crossAxisAlignment: CrossAxisAlignment.end,
          //         children: [
          //           ElevatedButton(
          //               onPressed: onSelect,
          //               child: const Icon(Icons.shopping_cart_checkout)),
          //           Text(
          //             item.dissName,
          //             style: const TextStyle(
          //                 fontSize: 20, fontWeight: FontWeight.bold),
          //           ),
          //           Text(
          //             item.discraption,
          //             style: const TextStyle(fontSize: 18),
          //           ),
          //           Text(
          //             item.price.toString(),
          //             style: const TextStyle(
          //                 fontSize: 18,
          //                 fontStyle: FontStyle.italic,
          //                 color: Colors.pink),
          //           ),
          //         ],
          //       ),
          //     )
          //   ],
          // ),
          child: Stack(
            children: [
              Positioned(
                height: deviceInfo.loaclheight,
                width: deviceInfo.width * .35,
                left: 0,
                top: 0,
                child: BlocProvider(
                  create: (context) => ManageImageBloc()
                    ..add(ImageSettingEvent(
                      collction: "",
                      tempImage: const Image(
                          image: AssetImage('assets/images/bestfood/bf3.jpeg')),
                      url: item.imgUrl,
                    )),
                  child: const ManageImageWidget(),
                ),
              ),
              Positioned(
                height: deviceInfo.loaclheight,
                width: deviceInfo.width * .6,
                right: 0,
                top: 0,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
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
          ));
    });
  }
}
