import 'package:flutter/material.dart';
import 'package:flutter_pet_shop/const.dart';
import 'package:flutter_pet_shop/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _buildUI(),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      title: const Text(
        "Cart",
      ),
    );
  }

  Widget _buildUI() {
    return Consumer<CartProvider>(
      builder: (context, provider, _) {
        return Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.80,
              child: ListView.builder(
                itemCount: provider.items.length,
                itemBuilder: (context, index) {
                  Pets pets = provider.items[index];
                  return ListTile(
                    title: Text(
                      pets.name,
                    ),
                    onLongPress: () {
                      provider.remove(pets);
                    },
                  );
                },
              ),
            ),
            Text("Cart Total: \$${provider.getCartTotal()}")
          ],
        );
      },
    );
  }
}
