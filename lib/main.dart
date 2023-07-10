import 'package:flutter/material.dart';
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

  runApp(const MyApp());
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => { 
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    // etc.
  };
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TuroBox Vend',
      scrollBehavior: MyCustomScrollBehavior(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: false,
      ),
      home: const MyHomePage(title: 'TuroBox Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80), // Set the desired height here
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
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(10),
        children: const [
          ProductCard(
            productName: 'Coke',
            productPrice: 20,
            productImage: 'assets/products/Coke.png',
          ),
          ProductCard(
            productName: 'Coke (Bottle)',
            productPrice: 20,
            productImage: 'assets/products/CokeBottle.png',
          ),
          ProductCard(
            productName: 'Coke (Can)',
            productPrice: 40,
            productImage: 'assets/products/CokeCan.png',
          ),
          ProductCard(
            productName: 'Coke Zero',
            productPrice: 20,
            productImage: 'assets/products/CokeZero.png',
          ),
          ProductCard(
            productName: 'Coke Zero (Bottle)',
            productPrice: 20,
            productImage: 'assets/products/CokeZeroBottle.png',
          ),
          ProductCard(
            productName: 'Coke Zero (Can)',
            productPrice: 40,
            productImage: 'assets/products/CokeZeroCan.png',
          ),
          ProductCard(
            productName: 'Fanta',
            productPrice: 20,
            productImage: 'assets/products/Fanta.png',
          ),
          ProductCard(
            productName: 'Fanta (Bottle)',
            productPrice: 20,
            productImage: 'assets/products/FantaBottle.png',
          ),
          ProductCard(
            productName: 'Fanta (Can)',
            productPrice: 40,
            productImage: 'assets/products/FantaCan.png',
          ),
          ProductCard(
            productName: 'Pepsi',
            productPrice: 20,
            productImage: 'assets/products/Pepsi.png',
          ),
          ProductCard(
            productName: 'Pepsi (Bottle)',
            productPrice: 20,
            productImage: 'assets/products/PepsiBottle.png',
          ),
          ProductCard(
            productName: 'Pepsi (Can)',
            productPrice: 40,
            productImage: 'assets/products/PepsiCan.png',
          ),
          ProductCard(
            productName: 'Sprite',
            productPrice: 20,
            productImage: 'assets/products/Sprite.png',
          ),
          ProductCard(
            productName: 'Sprite (Bottle)',
            productPrice: 20,
            productImage: 'assets/products/SpriteBottle.png',
          ),
          ProductCard(
            productName: 'Sprite (Can)',
            productPrice: 40,
            productImage: 'assets/products/SpriteCan.png',
          ),
          // Add more ProductCard widgets for other products
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String productName;
  final double productPrice;
  final String productImage;

  const ProductCard({
    super.key,
    required this.productName,
    required this.productPrice,
    required this.productImage,
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
              '₹${productPrice.toStringAsFixed(2)}',
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
          child: const Center(
            child: Text(
              'Product Details',
              style: TextStyle(fontSize: 20),
            ),
          ),
        );
      },
    );
  }
}