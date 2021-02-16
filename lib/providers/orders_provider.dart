import 'package:flutter/foundation.dart';

import 'package:fp_shop_app/models/cart_item.dart';
import 'package:fp_shop_app/models/order_item.dart';

class OrdersProvider with ChangeNotifier {
  // ignore: prefer_final_fields
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  void addOrder(
    List<CartItem> cartProducts,
    double total,
  ) {
    _orders.insert(
        0,
        OrderItem(
          id: DateTime.now().toString(),
          amount: total,
          dateTime: DateTime.now(),
          products: cartProducts,
        ));

    notifyListeners();
  }
}
