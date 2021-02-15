import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fp_shop_app/models/product.dart';
import 'package:fp_shop_app/providers/products_provider.dart';
import 'package:fp_shop_app/widgets/product_item.dart';

class ProductsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ProductsProvider productsData =
        Provider.of<ProductsProvider>(context);
    final List<Product> products = productsData.items;

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (ctx, i) => ProductItem(
        products[i].id,
        products[i].title,
        products[i].imageUrl,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
