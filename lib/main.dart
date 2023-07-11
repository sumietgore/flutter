import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:window_manager/window_manager.dart';

import 'homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Must add this line.
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
    size: Size(400, 400),
    center: true,
    fullScreen: true,
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    titleBarStyle: TitleBarStyle.hidden,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });

  runApp(const VendApp());
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class VendApp extends StatelessWidget {
  const VendApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'turobox Vend',
      // initialRoute: "/home",
      scrollBehavior: MyCustomScrollBehavior(),
      // routes: {"/home": (context) => const HomePage()},
      home: const HomePage(),
    );
  }
}
