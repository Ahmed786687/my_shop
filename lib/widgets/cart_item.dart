import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Provider
import '../providers/cart.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String productId;
  final String title;
  final int quantity;
  final double price;

  // ignore: prefer_const_constructors_in_immutables
  CartItem({Key? key, 
    required this.id,
    required this.productId,
    required this.title,
    required this.price,
    required this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    return Dismissible(
      // onDismissed: (direction) => DismissDirection.endToStart,
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: const Icon(Icons.delete, color: Colors.white, size: 50,),
        padding: const EdgeInsets.only(right: 20),
        alignment: Alignment.centerRight,
        
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction){
        cart.removeCartItem(productId);
      },
      child: Card(
        shadowColor: Theme.of(context).colorScheme.secondary,
        elevation: 5,
        margin: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 18,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                  padding: const EdgeInsets.all(3),
                  child: FittedBox(
                      child: Text(
                    "\$$price",
                  ))),
            ),
            title: Text(title),
            subtitle: Text("Total: \$${price * quantity}"),
            // here define how to reduce the products from here
            trailing: Text("$quantity X"),
          ),
        ),
      ),
    );
  }
}
