import 'package:flutter/material.dart';
import 'package:flutter_pet_shop/const.dart';
import 'package:flutter_pet_shop/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required this.pets});

  final Pets pets;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: Provider.of<CartProvider>(context),
      child: Scaffold(
        appBar: AppBar(
          title: Text(pets.name),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/cart");
              },
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/${pets.image}',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  '${pets.name}',
                  style: const TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  '\$${pets.price}',
                  style: const TextStyle(fontSize: 18.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  '${pets.store}',
                  style: const TextStyle(fontSize: 18.0),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    final cartProvider =
                        Provider.of<CartProvider>(context, listen: false);
                    cartProvider.add(pets);
                  },
                  child: const Text('Add to Cart'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
