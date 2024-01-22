import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/responsive/widget/info_widget.dart';
import '../bloc/order_mangement_bloc.dart';
import 'order_widget.dart';
/// for has order list of item 
/// and show as a part of Order Widget
class OrdersListItems extends StatelessWidget {
  const OrdersListItems({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderMangementBloc, OrderMangementState>(
      builder: (context, state) {
        return InfoWidget(builder: (context, deviceInfo) {
           if (state is OrderMangementInitial) {
             return Expanded(

               child: ListView.builder(
                
                physics: const ClampingScrollPhysics(),
                itemCount: state.orders.length,
                itemBuilder: (context, index) => OrderWidget(state.orders[index]),
                         ),
             );
          } else if (state is OrdersLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return const Center(child: Text("error"));
          }
        });
      },
    );
  }
}
