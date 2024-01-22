import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/shared/responsive/widget/info_widget.dart';

import '../bloc/odre_details_bloc.dart';

class OrderItems extends StatelessWidget {
  const OrderItems({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderDetailsBloc, OrderDetailsState>(
      builder: (context, state) {
        if (state is OdreDetailsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is OrderDetailsLoaded) {
          var l = state.items;
          return InfoWidget(builder: (context, dev) {
            if (l.isEmpty) {
              return const SizedBox(
                height: 0,
                width: 0,
              );
            }
            print(dev.localwith);
            print(dev.width);
            print(dev.loaclheight);
            print(dev.height);
            return ListView.builder(
                physics: const ClampingScrollPhysics(),
                itemCount: l.length,
                shrinkWrap:true ,
                itemBuilder: (context, index) {
                  var x = l[index];
                  return Dismissible(
                    key: ValueKey(index),
                    child: Container(
                      height: 80,
                      width:400,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(flex: 1, child: Text(x.itemName)),
                          Flexible(flex: 1, child: Text(x.count.toString())),
                          Text(x.totalprice.toString()),
                          Flexible(
                            flex: 1,
                            child: ElevatedButton(
                                onPressed: () {}, child: const Text("action")),
                          )
                        ],
                      ),
                    ),
                  );
                });
          });
        } else if (state is OrderDetailsFailure) {
          return const SizedBox(height: 50,width: 100, child: Center(child: Text(" error")));
        } else {
          return const SizedBox(
            height: 0,
            width: 0,
          );
        }
      },
    );
  }
}
