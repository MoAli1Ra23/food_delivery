import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/cart/domain/entities/order.dart';
import 'package:food_delivery/shared/responsive/divce_info.dart';
import 'package:food_delivery/shared/responsive/widget/info_widget.dart';
import 'package:food_delivery/shared/widgets/custom_appbar_reusable.dart';

import '../bloc/order_mangement_bloc.dart';

class OrderMangementPage extends StatelessWidget {
  const OrderMangementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 60,
          child: CustomReusableAppBar(
              title: "Orders",
              leftIcon: Icon(Icons.arrow_back_ios_new_rounded),
              righeIcon: Icon(Icons.payments_sharp)),
        ),
      ],
    );
  }
}

class OrdersList extends StatelessWidget {
  const OrdersList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderMangementBloc, OrderMangementState>(
      builder: (context, state) {
        return InfoWidget(builder: (context, deviceInfo) {
          if (state is OrderMangementInitial) {
            return ListView.builder(
              physics: const ClampingScrollPhysics(),
              itemCount: state.orders.length,
              itemBuilder: (context, index) => OrderWidget(state.orders[index]),
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

class OrderWidget extends StatelessWidget {
  final Order order;
  const OrderWidget(this.order, {super.key});

  @override
  Widget build(BuildContext context) {
    return const Center();
  }
}
