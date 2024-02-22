import 'package:flutter/material.dart';
import 'package:flutter_pet_shop/const.dart';

class CartProvider extends ChangeNotifier {
  final List<Pets> _items = [];

  List<Pets> get items => _items;

  void add(Pets item) {
    _items.add(item);
    notifyListeners();
  }

  void remove(Pets item) {
    _items.remove(item);
    notifyListeners();
  }

  void removeAll() {
    _items.clear();
    notifyListeners();
  }

  double getCartTotal() {
    return _items.fold(0, (previousValue, item) => previousValue + item.price);
  }
}
