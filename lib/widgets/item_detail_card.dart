import 'package:flutter/material.dart';

class ItemDetailCard extends StatelessWidget {
  const ItemDetailCard({
    Key? key,
    required this.text,
    required this.color,
    required this.cardColor,
    required this.fontSize,
  }) : super(key: key);

  final String text;
  final Color color;
  final Color cardColor;
  final double fontSize;
  

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor,
      child: Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        child: Text(
          text,
          style: TextStyle(
            color: color,
            fontSize: fontSize,
          ),
          softWrap: true,
        ),
      ),
    );
  }
}