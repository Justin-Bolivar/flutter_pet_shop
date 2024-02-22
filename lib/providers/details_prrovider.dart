import 'package:flutter/material.dart';
import 'package:flutter_pet_shop/const.dart';

class DetailProvider extends ChangeNotifier {
  Pets? _selectedPet;

  Pets? get selectedPet => _selectedPet;

  void selectPet(Pets pet) {
    _selectedPet = pet;
    notifyListeners();
  }

  void clearSelection() {
    _selectedPet = null;
    notifyListeners();
  }
}
