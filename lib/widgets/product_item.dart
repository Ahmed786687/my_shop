// ignore_for_file: deprecated_member_use

// packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// providers
import '../providers/cart.dart';
import '../providers/product.dart';

// screens
import '../screens/product_detail_screen.dart';

// ignore: use_key_in_widget_constructors
class ProductItem extends StatelessWidget {
  // const ProductItem({Key? key}) : super(key: key);

  // final String id;
  // final String title;
  // final String imageUrl;

  // // ignore: use_key_in_widget_constructors
  // const ProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    //  we set listener to false when we don't need to rebuild the object or widget
    // other wise we set listener to ture
    // this is product provider
    final product = Provider.of<Product>(
      context,
      listen: false,
    );
    // cart provider
    final cart = Provider.of<Cart>(
      context,
      listen: false,
    );
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: product.id,
            );
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(
            builder: (context, value, child) => IconButton(
              // color: Theme.of(context).primaryColor,
              icon: Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_border,
              ),
              onPressed: () {
                product.toggleFavoriteStatus();
              },
            ),
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            // color: Theme.of(context).accentColor,
            icon: const Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {
              cart.addItems(
                product.id,
                product.price,
                product.title,
              );
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              // Scaffold.of(context).hideCurrentSnackBar(); //
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  duration: const Duration(seconds: 2),
                  content: const Text(
                    "Added Item to Cart",
                  ),
                  action: SnackBarAction(
                    label: 'UNDO',
                    onPressed: () {
                      cart.removeSingleItem(product.id);
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
