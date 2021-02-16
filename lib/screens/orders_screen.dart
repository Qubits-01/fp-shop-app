import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fp_shop_app/providers/orders_provider.dart' show OrdersProvider;
import 'package:fp_shop_app/widgets/order_item.dart';

class OdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final OrdersProvider orderData = Provider.of<OrdersProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Oders'),
      ),
      body: ListView.builder(
        itemCount: orderData.orders.length,
        itemBuilder: (ctx, i) => OrderItem(
          orderData.orders[i],
        ),
      ),
    );
  }
}
