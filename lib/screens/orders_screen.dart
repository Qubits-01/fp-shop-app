import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fp_shop_app/providers/orders_provider.dart' show OrdersProvider;
import 'package:fp_shop_app/widgets/order_item.dart';
import 'package:fp_shop_app/widgets/app_drawer.dart';

class OrdersScreen extends StatefulWidget {
  static const routeName = '/orders';

  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero).then((_) async {
      setState(() {
        _isLoading = true;
      });

      await Provider.of<OrdersProvider>(context, listen: false)
          .fetchAndSetOrders();

      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final OrdersProvider orderData = Provider.of<OrdersProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Oders'),
      ),
      drawer: AppDrawer(),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: orderData.orders.length,
              itemBuilder: (ctx, i) => OrderItem(
                orderData.orders[i],
              ),
            ),
    );
  }
}
