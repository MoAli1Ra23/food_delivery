import 'package:flutter/material.dart';
import 'package:food_delivery/shared/widgets/custom_appbar_reusable.dart';

import '../widgets/order_list_items.dart';

class OrderMangementPage extends StatelessWidget {
  const OrderMangementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 60,
              child: CustomReusableAppBar(
                  title: "Orders",
                  leftIcon: Icon(Icons.arrow_back_ios_new_rounded),
                  righeIcon: Icon(Icons.payments_sharp)),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 15),
                child: OrdersListItems(),
              ),
            ),
      
          ],
        ),
      ),
    );
  }
}
