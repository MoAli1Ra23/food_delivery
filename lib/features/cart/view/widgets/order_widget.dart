import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/responsive/widget/info_widget.dart';
import '../../domain/entities/order.dart';
import '../bloc/odre_details_bloc.dart';
import 'orders_list.dart';

/// for has order main data like [order.dateTime] [order.state]
///  and show it as  part of any page
class OrderWidget extends StatelessWidget {
  final Order order;
  const OrderWidget(this.order, {super.key});
//   final String userId;
//   final List<CartItem> carts;
//   final DateTime dateTime;
//   final double totalprice;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderDetailsBloc(),
      child: InfoWidget(builder: (context, device) {
        return Column(
          children: [
            Container(
              
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  gradient: LinearGradient(
                      colors: [Colors.grey.shade600, Colors.white70])),
              height: 70,
             
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(order.dateTime.toString()),
                  Text(order.state.toString()),
                  Text(order.totalprice.toString()),
                  IconButton.filled(
                      onPressed: () {
                        BlocProvider.of<OrderDetailsBloc>(context)
                            .add(OrderDetailsRequest(order.userId));
                      },
                      icon: const Icon(Icons.expand_circle_down_rounded))
                ],
              ),
            ),
            const OrderItems(),
          ],
        );
      }),
    );
  }
}
