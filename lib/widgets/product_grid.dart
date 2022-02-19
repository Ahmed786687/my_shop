// packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// providers
import '../providers/products.dart';

// widgets
import '../widgets/product_item.dart';

// ignore: must_be_immutable
class ProductsGrid extends StatelessWidget {
  bool showFavorites;
  ProductsGrid(this.showFavorites, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = showFavorites ? productsData.favoritesItems : productsData.items;

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) =>  ChangeNotifierProvider.value(
        value: products[index],
        child: ProductItem(),
          // products[index].id,
          // products[index].title,
          // products[index].imageUrl,
        // ),
      ),
    );
  }
}
