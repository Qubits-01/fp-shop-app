import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:fp_shop_app/models/cart_item.dart';
import 'package:fp_shop_app/models/order_item.dart';

class OrdersProvider with ChangeNotifier {
  // ignore: prefer_final_fields
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  Future<void> addOrder(List<CartItem> cartProducts, double total) async {
    const url = 'https://p3-inc-default-rtdb.firebaseio.com/orders.json';
    final timestamp = DateTime.now();

    final response = await http.post(
      url,
      body: json.encode({
        'amount': total,
        'dateTime': timestamp.toIso8601String(),
        'products': cartProducts
            .map((cp) => {
                  'id': cp.id,
                  'title': cp.title,
                  'quantity': cp.quantity,
                  'price': cp.price,
                })
            .toList(),
      }),
    );

    _orders.insert(
        0,
        OrderItem(
          id: json.decode(response.body)['name'] as String,
          amount: total,
          dateTime: timestamp,
          products: cartProducts,
        ));

    notifyListeners();
  }
}
