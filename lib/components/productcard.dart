import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String productName;
  final double productPrice;
  final String productImage;
  final String productDescription;

  const ProductCard(
      {super.key,
      required this.productName,
      required this.productPrice,
      required this.productImage,
      required this.productDescription});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print("touch"),
      child: Card(
        color: Colors.grey.shade100,
        elevation: 0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              productImage,
              width: 60,
              height: 60,
            ),
            const SizedBox(height: 10),
            Text(
              productName,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              '₹ ${productPrice.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
