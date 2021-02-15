import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fp_shop_app/screens/products_overview_screen.dart';
import 'package:fp_shop_app/screens/product_detail_screen.dart';
import 'package:fp_shop_app/providers/products_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => ProductsProvider(),
      child: MaterialApp(
        title: 'My Shop',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
        },
      ),
    );
  }
}
