import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../providers/orders.dart' as ord;

class OrderItem extends StatefulWidget {
  final ord.OrderItem order;
  const OrderItem(this.order, {Key? key}) : super(key: key);

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var _expanded = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        color: Theme.of(context).primaryColorLight,
        margin: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(
                '\$${widget.order.amount.toStringAsFixed(2)}',
                style: TextStyle(
                  color: Theme.of(context).primaryColorDark,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                DateFormat('dd / MM / yyyy ,  hh:mm')
                    .format(widget.order.dateTime),
                style: const TextStyle(
                  fontStyle: FontStyle.italic,
                ),
              ),
              trailing: IconButton(
                icon: Icon(
                  _expanded ? Icons.expand_less : Icons.expand_more,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () {
                  setState(() {
                    _expanded = !_expanded;
                  });
                },
              ),
            ),
            if (_expanded)
              Container(
                // color: Colors.teal,
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 16,
                ),
                height: min(widget.order.products.length * 30 + 20, 300),
                child: ListView(
                  children: widget.order.products
                      .map(
                        (prod) => Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  prod.title,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).primaryColorDark,
                                  ),
                                ),
                                Text(
                                  '${prod.quantity}x \$${prod.price}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              color: Theme.of(context).colorScheme.secondary,
                              thickness: 2,
                            ),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),
            // Divider()
          ],
        ),
      ),
    );
  }
}
