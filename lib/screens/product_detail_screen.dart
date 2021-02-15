import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fp_shop_app/providers/products_provider.dart';

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

    final loadedProduct = Provider.of<ProductsProvider>(
      context,
      listen: false,
    ).findById(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          loadedProduct.title,
        ),
      ),
    );
  }
}
