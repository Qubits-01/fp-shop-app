import 'package:flutter/foundation.dart';

class CartItem {
  CartItem({
    @required this.id,
    @required this.title,
    @required this.quantity,
    @required this.price,
  });

  final String id;
  final String title;
  final int quantity;
  final double price;
}
