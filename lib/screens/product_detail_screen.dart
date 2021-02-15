import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  // const ProductDetailScreen(
  //   this.title,
  //   this.price,
  // );

  // final String title;
  // final double price;

  static const routeName = 'product-detail';

  @override
  Widget build(BuildContext context) {
    final String productId =
        ModalRoute.of(context).settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'title',
        ),
      ),
    );
  }
}
