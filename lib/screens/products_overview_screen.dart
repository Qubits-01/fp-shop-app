import 'package:flutter/material.dart';

import 'package:fp_shop_app/widgets/products_grid.dart';

class ProductsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Shop',
        ),
      ),
      body: ProductsGrid(),
    );
  }
}
