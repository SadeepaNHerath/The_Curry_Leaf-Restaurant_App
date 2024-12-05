import 'package:curry_leaf/models/shop.dart';
import 'package:curry_leaf/pages/cart_page.dart';
import 'package:curry_leaf/pages/intro_page.dart';
import 'package:curry_leaf/pages/menu_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      routes: {
        '/intro-page': (context) => const IntroPage(),
        '/menu-page': (context) => const MenuPage(),
        '/cart-page': (context) => const CartPage(),
      },
    );
  }
}
