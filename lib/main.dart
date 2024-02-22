import 'package:flutter/material.dart';
import 'package:flutter_pet_shop/const.dart';
import 'package:flutter_pet_shop/screens/details_screen.dart';
import 'package:provider/provider.dart';
import 'providers/cart_provider.dart';
import 'screens/cart.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "/products",
      routes: {
        "/products": (context) => const ProductsPage(),
        "/details": (context) {
          final Pets pets = ModalRoute.of(context)!.settings.arguments as Pets;
          return DetailsPage(pets: pets);
        },
        "/cart": (context) => const CartPage(),
      },
    );
  }
}
