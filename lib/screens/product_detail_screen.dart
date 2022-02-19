// packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// provider
import '../providers/products.dart';

import '../widgets/item_detail_card.dart';

// ignore: use_key_in_widget_constructors
class ProductDetailScreen extends StatelessWidget {
  // final String title;

  // ProductDetailScreen(this.title);
  static const routeName = '/product-detial';
  @override
  Widget build(BuildContext context) {
    final String productId =
        ModalRoute.of(context)!.settings.arguments as String; // is the id
    //...

    final productLoader = Provider.of<Products>(
      context,
      listen: false,
    ).findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(productLoader.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              height: 300,
              child: Image.network(
                productLoader.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ItemDetailCard(
              text: "Price \$${productLoader.price}",
              color: Colors.white,
              cardColor: Theme.of(context).primaryColorDark,
              fontSize: 18,
            ),
            Card(
              color: Theme.of(context).colorScheme.secondary,
              child: Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                child: Column(
                  children: [
                    ItemDetailCard(
                      text: "Description",
                      color: Colors.white,
                      cardColor: Theme.of(context).primaryColor,
                      fontSize: 20,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ItemDetailCard(
                      text: productLoader.description,
                      color: Theme.of(context).primaryColor,
                      cardColor: Colors.white,
                      fontSize: 16,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
