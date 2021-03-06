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

  Future<void> fetchAndSetOrders() async {
    const url = 'https://p3-inc-default-rtdb.firebaseio.com/orders.json';
    final List<OrderItem> loadedOrders = [];

    final response = await http.get(url);
    final extractedData = json.decode(response.body) as Map<String, dynamic>;

    if (extractedData == null) {
      return;
    }

    extractedData.forEach((orderId, orderData) {
      loadedOrders.add(
        OrderItem(
          id: orderId,
          amount: orderData['amount'] as double,
          dateTime: DateTime.parse(orderData['dateTime'] as String),
          products: (orderData['products'] as List<dynamic>)
              .map((item) => CartItem(
                    id: item['id'] as String,
                    price: item['price'] as double,
                    quantity: item['quantity'] as int,
                    title: item['title'] as String,
                  ))
              .toList(),
        ),
      );
    });

    _orders = loadedOrders.reversed.toList();
    notifyListeners();
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
