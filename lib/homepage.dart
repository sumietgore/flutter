import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:badges/badges.dart' as badges;

import "components/productcard.dart";

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  'assets/logo.svg', // Replace with your SVG logo path
                  width: 36,
                  height: 36,
                ),
                // const SizedBox(width: 16),
                const Text(
                  'TuroBox Vend',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                // const SizedBox(width: 50),
                badges.Badge(
                  badgeContent: const Text("3"),
                  child: const Icon(
                    Icons.shopping_cart,
                    size: 30,
                  ),
                )
              ],
            ),
          ),
        ),
        body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          final double maxWidth = constraints.maxWidth;
          final int crossAxisCount = (maxWidth ~/ 180)
              .clamp(1, 8); // Adjust the desired item width as needed

          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics());
          ScrollPhysics physics = const BouncingScrollPhysics();
          final ScrollPhysics mergedPhysics =
              physics.applyTo(const AlwaysScrollableScrollPhysics());
          final ScrollController controller = ScrollController();

          return Container(
            color: Colors.white,
            child: GridView.count(
              physics: mergedPhysics,
              crossAxisCount: crossAxisCount,
              controller: controller,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              padding: const EdgeInsets.all(20),
              children: const [
                ProductCard(
                  productName: 'Coke',
                  productPrice: 20,
                  productImage: 'assets/products/Coke.png',
                  productDescription: 'Coke',
                ),
                ProductCard(
                  productName: 'Coke (Bottle)',
                  productPrice: 20,
                  productImage: 'assets/products/CokeBottle.png',
                  productDescription: 'Coke Bottle',
                ),
                ProductCard(
                  productName: 'Coke (Can)',
                  productPrice: 40,
                  productImage: 'assets/products/CokeCan.png',
                  productDescription: 'Coke Can',
                ),
                ProductCard(
                  productName: 'Coke Zero',
                  productPrice: 20,
                  productImage: 'assets/products/CokeZero.png',
                  productDescription: 'Coke Zero',
                ),
                ProductCard(
                  productName: 'Coke Zero (Bottle)',
                  productPrice: 20,
                  productImage: 'assets/products/CokeZeroBottle.png',
                  productDescription: 'Coke Zero Bottle',
                ),
                ProductCard(
                  productName: 'Coke Zero (Can)',
                  productPrice: 40,
                  productImage: 'assets/products/CokeZeroCan.png',
                  productDescription: 'Coke Zero Can',
                ),
                ProductCard(
                  productName: 'Fanta',
                  productPrice: 20,
                  productImage: 'assets/products/Fanta.png',
                  productDescription: 'Fanta',
                ),
                ProductCard(
                  productName: 'Fanta (Bottle)',
                  productPrice: 20,
                  productImage: 'assets/products/FantaBottle.png',
                  productDescription: 'Fanta Bottle',
                ),
                ProductCard(
                  productName: 'Fanta (Can)',
                  productPrice: 40,
                  productImage: 'assets/products/FantaCan.png',
                  productDescription: 'Fanta Can',
                ),
                ProductCard(
                  productName: 'Pepsi',
                  productPrice: 20,
                  productImage: 'assets/products/Pepsi.png',
                  productDescription: 'Pepsi',
                ),
                ProductCard(
                  productName: 'Pepsi (Bottle)',
                  productPrice: 20,
                  productImage: 'assets/products/PepsiBottle.png',
                  productDescription: 'Pepsi Bottle',
                ),
                ProductCard(
                  productName: 'Pepsi (Can)',
                  productPrice: 40,
                  productImage: 'assets/products/PepsiCan.png',
                  productDescription: 'Pepsi Can',
                ),
                ProductCard(
                  productName: 'Sprite',
                  productPrice: 20,
                  productImage: 'assets/products/Sprite.png',
                  productDescription: 'Sprite',
                ),
                ProductCard(
                  productName: 'Sprite (Bottle)',
                  productPrice: 20,
                  productImage: 'assets/products/SpriteBottle.png',
                  productDescription: 'Sprite Bottle',
                ),
                ProductCard(
                  productName: 'Sprite (Can)',
                  productPrice: 40,
                  productImage: 'assets/products/SpriteCan.png',
                  productDescription: 'Sprite Can',
                ),
              ],
            ),
          );
        }));
  }
}
