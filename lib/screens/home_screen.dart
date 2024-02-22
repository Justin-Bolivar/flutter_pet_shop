import 'package:flutter/material.dart';
import 'package:flutter_pet_shop/const.dart';
import 'package:flutter_pet_shop/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  String _searchText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _buildUI(context),
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      title: const Text(
        "Pet Shops",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
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
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(48.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search Pets',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40.0),
              ),
            ),
            onChanged: (value) {
              setState(() {
                _searchText = value;
              });
            },
          ),
        ),
      ),
    );
  }

  Widget _buildUI(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    final filteredPets = PETS.where((pet) {
      final name = pet.name.toLowerCase();
      final searchText = _searchText.toLowerCase();
      return name.contains(searchText);
    }).toList();

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.7,
      ),
      itemCount: filteredPets.length,
      itemBuilder: (context, index) {
        Pets product = filteredPets[index];
        return GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              '/details',
              arguments: Pets(
                name: product.name,
                price: product.price,
                image: product.image,
                store: product.store,
              ),
            );
          },
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(12)),
                    child: Image.asset(
                      'assets/${product.image}',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$${product.price.toString()}",
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          if (cartProvider.items.contains(product)) {
                            cartProvider.remove(product);
                          } else {
                            cartProvider.add(product);
                          }
                        },
                        icon: Icon(
                          cartProvider.items.contains(product)
                              ? Icons.shopping_cart
                              : Icons.add_shopping_cart,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
