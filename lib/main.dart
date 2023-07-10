import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Must add this line.
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
    size: Size(480, 800),
    center: true,
    // fullScreen: true,
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    titleBarStyle: TitleBarStyle.hidden,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });

  runApp(const VendingMachineApp());
}


class VendingMachineApp extends StatelessWidget {
  const VendingMachineApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Vending Machine',
      home: HomePage(),
    );
  }
}

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
          child: const Text(
            'Vending Machine',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: CupertinoScrollbar(
        child: GridView.count(
          crossAxisCount: 2,
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
            key:Key('FantaBottle'),
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
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String productName;
  final double productPrice;
  final String productImage;
  final String productDescription;

  const ProductCard({
    super.key,
    required this.productName,
    required this.productPrice,
    required this.productImage,
    required this.productDescription
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showProductDetails(context);
      },
      child: Card(
        elevation: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              productImage,
              width: 80,
              height: 80,
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

  void _showProductDetails(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 500,
          color: Colors.white,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                productName,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Price: \$${productPrice.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              Text(
                productDescription,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Implement the logic to add the product to the cart
                  _addToCart();
                  Navigator.of(context).pop(); // Close the bottom sheet
                },
                child: const Text('Add to Cart'),
              ),
              // Add more product details as needed
            ],
          ),
        );
      },
    );
  }

  void _addToCart() {
    // Implement the logic to add the product to the cart
    // This method will be called when the "Add to Cart" button is pressed
  }
}


