// ignore_for_file: constant_identifier_names

// packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:shop_app/providers/product.dart';

// providers
import '../providers/cart.dart';

// screens
import '../screens/cart_screen.dart';

// widget
import '../widgets/product_grid.dart';
import '../widgets/badge.dart';
import '../widgets/app_drawer.dart';

enum FilterOptions {
  Favorite,
  All,
}

// ignore: use_key_in_widget_constructors
class ProductOverviewScreen extends StatefulWidget {
  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  bool _showFavoritesItemsOnly = false;

  // get color => null;
  @override
  Widget build(BuildContext context) {
    // final product = Provider.of<Product>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Shop",
        ),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorite) {
                  _showFavoritesItemsOnly = true;
                } else {
                  // Show all Items
                  _showFavoritesItemsOnly = false;
                }
              });
            },
            icon: const Icon(Icons.more_vert),
            itemBuilder: (context) => [
              const PopupMenuItem(
                child: Text("Only Favorite"),
                value: FilterOptions.Favorite,
              ),
              const PopupMenuItem(
                child: Text("Show All"),
                value: FilterOptions.All,
              ),
            ],
          ),
          Consumer<Cart>(
            builder: (context, cart, child) {
              return Badge(
                child: IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  onPressed: () {
                    Navigator.of(context).pushNamed(CartScreen.routeName);
                  },
                ),
                value: cart.itemCount,
                color: Theme.of(context).colorScheme.secondary,
              );
            },
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: ProductsGrid(_showFavoritesItemsOnly),
    );
  }
}
