class Pets {
  final String name;
  final double price;
  final String store;
  final String image;

  Pets({
    required this.name,
    required this.price,
    required this.store,
    required this.image,
  });
}

final List<Pets> PETS = [
  Pets(
    name: 'Bella',
    price: 300.00,
    store: 'Pet Store 1',
    image: 'cat1.png',
  ),
  Pets(
    name: 'Max',
    price: 699.99,
    store: 'Pet Store 2',
    image: 'cat2.png',
  ),
  Pets(
    name: 'Luna',
    price: 129.99,
    store: 'Pet Store 1',
    image: 'cat3.png',
  ),
  Pets(
    name: 'Charlie',
    price: 199.99,
    store: 'Pet Store 2',
    image: 'cat1.png',
  ),
  Pets(
    name: 'Daisy',
    price: 499.99,
    store: 'Pet Store 1',
    image: 'cat2.png',
  ),
  Pets(
    name: 'Rocky',
    price: 799.99,
    store: 'Pet Store 2',
    image: 'dog1.png',
  ),
  Pets(
    name: 'Lucy',
    price: 1299.99,
    store: 'Pet Store 1',
    image: 'dog2.png',
  ),
  Pets(
    name: 'Milo',
    price: 79.99,
    store: 'Pet Store 2',
    image: 'dog3.png',
  ),
  Pets(
    name: 'Rossie',
    price: 299.99,
    store: 'Pet Store 1',
    image: 'dog1.png',
  ),
  Pets(
    name: 'Teddie',
    price: 129.99,
    store: 'Pet Store 2',
    image: 'dog2.png',
  ),
];
