// packges
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/orders.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/screens/orders_screen.dart';

// Providers
import './providers/cart.dart';
import './providers/products.dart';

//screens
import './screens/product_detail_screen.dart';
import './screens/product_overview_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          // 1st method of Prodvider
          create: (context) => Products(),
        ),
        ChangeNotifierProvider(
          // 1st method of Prodvider
          create: (context) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (context) => Orders(),
        )

        // ChangeNotifierProvider.value( // 2nd mehtod of Provider, this is not much better here
        //   value: Cart(),
        // ),
      ],
      child: MaterialApp(
        title: "My Shop",
        theme: ThemeData(
          primarySwatch: Colors.teal,
          // ignore: deprecated_member_use
          accentColor: Colors.teal.shade200,
          fontFamily: 'Lato',
        ),
        home: ProductOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
          CartScreen.routeName: ((context) => const CartScreen()),
          OrdersScreen.routeName: ((context) => const OrdersScreen()),
        },
      ),
    );
  }
}
