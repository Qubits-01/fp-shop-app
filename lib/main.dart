import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fp_shop_app/providers/cart_provider.dart';
import 'package:fp_shop_app/providers/orders_provider.dart';
import 'package:fp_shop_app/providers/products_provider.dart';
import 'package:fp_shop_app/screens/cart_screen.dart';
import 'package:fp_shop_app/screens/orders_screen.dart';
import 'package:fp_shop_app/screens/edit_product_screen.dart';
import 'package:fp_shop_app/screens/products_overview_screen.dart';
import 'package:fp_shop_app/screens/product_detail_screen.dart';
import 'package:fp_shop_app/screens/user_products_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => ProductsProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => OrdersProvider(),
        ),
      ],
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
          CartScreen.routeName: (ctx) => CartScreen(),
          OrdersScreen.routeName: (ctx) => OrdersScreen(),
          UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
          EditProductScreen.routeName: (ctx) => EditProductScreen(),
        },
      ),
    );
  }
}
