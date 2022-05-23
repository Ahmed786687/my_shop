// packges
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Providers
import './providers/cart.dart';
import './providers/orders.dart';
import './providers/products.dart';

//screens
import './screens/cart_screen.dart';
import './screens/orders_screen.dart';
import './screens/product_detail_screen.dart';
import './screens/product_overview_screen.dart';
import './screens/user_product_screen.dart';

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
        debugShowCheckedModeBanner: false,
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
          CartScreen.routeName: (context) => const CartScreen(),
          OrdersScreen.routeName: (context) => const OrdersScreen(),
          UserProductsScreen.routeName: (context) => const UserProductsScreen(),
        },
      ),
    );
  }
}
