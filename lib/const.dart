class Pets {
  final int id;
  final String name;
  final double price;
  final String store;
  final String image;

  Pets({
    required this.id,
    required this.name,
    required this.price,
    required this.store,
    required this.image,
  });
}

final List<Pets> PETS = [
  Pets(
    id: 0,
    name: 'Bella',
    price: 300.00,
    store: 'Pet Store 1',
    image: 'cat1.png',
  ),
  Pets(
    id: 1,
    name: 'Max',
    price: 699.99,
    store: 'Pet Store 2',
    image: 'cat2.png',
  ),
  Pets(
    id: 2,
    name: 'Luna',
    price: 129.99,
    store: 'Pet Store 1',
    image: 'cat3.png',
  ),
  Pets(
    id: 3,
    name: 'Charlie',
    price: 199.99,
    store: 'Pet Store 2',
    image: 'cat1.png',
  ),
  Pets(
    id: 4,
    name: 'Daisy',
    price: 499.99,
    store: 'Pet Store 1',
    image: 'cat2.png',
  ),
  Pets(
    id: 5,
    name: 'Rocky',
    price: 799.99,
    store: 'Pet Store 2',
    image: 'dog1.png',
  ),
  Pets(
    id: 6,
    name: 'Lucy',
    price: 1299.99,
    store: 'Pet Store 1',
    image: 'dog2.png',
  ),
  Pets(
    id: 7,
    name: 'Milo',
    price: 79.99,
    store: 'Pet Store 2',
    image: 'dog3.png',
  ),
  Pets(
    id: 8,
    name: 'Rossie',
    price: 299.99,
    store: 'Pet Store 1',
    image: 'dog1.png',
  ),
  Pets(
    id: 9,
    name: 'Teddie',
    price: 129.99,
    store: 'Pet Store 2',
    image: 'dog2.png',
  ),
];
