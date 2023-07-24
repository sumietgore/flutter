import 'package:flutter/material.dart';

import '../components/productcard.dart';

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
              child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text("TuroBox Vend")]),
            )),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () => Navigator.pushNamed(context, '/cart'),
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Icon(Icons.shopping_bag),
          ),
        ),
        body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          final double maxWidth = constraints.maxWidth;
          final int crossAxisCount = (maxWidth ~/ 200).clamp(1, 8);

          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics());
          ScrollPhysics physics = const BouncingScrollPhysics();

          final ScrollPhysics mergedPhysics =
              physics.applyTo(const AlwaysScrollableScrollPhysics());

          final ScrollController controller = ScrollController();

          return Container(
            color: Colors.white,
            child: GridView.count(
              scrollDirection: Axis.vertical,
              physics: mergedPhysics,
              crossAxisCount: crossAxisCount,
              controller: controller,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              padding: const EdgeInsets.only(
                  left: 30, right: 30, bottom: 50, top: 0),
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
