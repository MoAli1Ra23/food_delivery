// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:food_delivery/features/cart/view/bloc/cart_bloc.dart';
import 'package:food_delivery/shared/responsive/widget/info_widget.dart';
import 'package:food_delivery/shared/widgets/custom_appbar_reusable.dart';

import '../../../image_management/view/bloc/manage_image_bloc.dart';
import '../../../image_management/view/widgets/manage_image_widget.dart';
import '../../domain/entities/cart_item.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    /// par
    /// List of cart items
    ///
    return SafeArea(
      child: Scaffold(
        body: InfoWidget(builder: (context, device) {
          return Column(
            children: [
              const SizedBox(
                height: 60,
                child: CustomReusableAppBar(
                    title: "Cart",
                    leftIcon: Icon(Icons.arrow_back_ios_new_rounded),
                    righeIcon: Icon(Icons.payments_sharp)),
              ),
              const SizedBox(
                height: 50,
              ),
              const Expanded(child: CartListWidget()),
              const SizedBox(
                height: 50,
              ),
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  if (state is CartInitial) {
                    return Text(
                      state.totalprice.toString(),
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                          fontStyle: FontStyle.italic,
                          color: Colors.red.shade900),
                    );
                  }
                  return const Text(
                    "200",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic),
                  );
                },
              )
            ],
          );
        }),
      ),
    );
  }
}

class CartListWidget extends StatelessWidget {
  const CartListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InfoWidget(builder: (context, dv) {
      return BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartInitial && state.cartitems.isNotEmpty) {
            var k = state.cartitems;

            return ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: k.length, //(state as CartInitial).cartitems.length,

              itemBuilder: (context, index) => CartItemWidget(
                // item: state.cartitems[index],
                item: k[index],
                index: index,
              ),
            );
          } else {
            return const Center(child: Text("Empyt Cart"));
          }
        },
      );
    });
  }
}

class CartItemWidget extends StatelessWidget {
  CartItemWidget({
    Key? key,
    required this.item,
    required this.index,
  }) : super(key: key);
  final CartItem item;
  final int index;
  final GlobalKey jj = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return InfoWidget(builder: (context, devie) {
      /// here I use devie.width instead devie.localwith becouse  localwith is infintey
      ///
      return Dismissible(
        key: jj,
        onDismissed: (_) {
          BlocProvider.of<CartBloc>(context).add(DeleteItemEvent(index));
        },
        child: Container(
          margin: const EdgeInsets.only(top: 15.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 239, 235, 235)),
          height: 200,
          width: devie.width,
          child: Row(
            children: [
              Container(
                constraints: const BoxConstraints(
                  maxHeight: 200,
                  maxWidth: 200,
                ),
                height: 200,
                width: devie.width * 0.5,
                child: BlocProvider(
                  lazy: false,
                  create: (context) => ManageImageBloc()
                    ..add(
                      ImageSettingEvent(
                        collction: "",
                        tempImage: Image(
                            height: 200,
                            width: devie.width * 0.5,
                            fit: BoxFit.cover,
                            image: const AssetImage(
                                'assets/images/bestfood/bf3.jpeg')),
                        url: item.imgUrl,
                      ),
                    ),
                  child: const ManageImageWidget(),
                ),
              ),
              SizedBox(
                height: 200,
                width: devie.width * 0.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: 100,
                        width: devie.width * 0.5,
                        child: Text(
                          item.itemName,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        )),
                    SizedBox(
                      height: 60,
                      width: devie.width * 0.5,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                            flex: 1,
                            child: IconButton.filled(
                                onPressed: () {
                                  BlocProvider.of<CartBloc>(context)
                                      .add(IncraesCountEvent(item, index));
                                },
                                icon: const Icon(Icons.add)),
                          ),
                          Flexible(flex: 1, child: Text(item.count.toString())),
                          Flexible(
                            flex: 1,
                            child: IconButton.outlined(
                                onPressed: () {
                                  BlocProvider.of<CartBloc>(context)
                                      .add(DecraesCountEvent(item, index));
                                },
                                icon: const Icon(Icons.minimize_rounded)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      width: devie.width * 0.5,
                      child: Text(item.totalprice.toString()),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
