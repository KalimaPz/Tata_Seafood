import 'package:flutter/material.dart';
import 'package:sdm_mini_project/actions/menu.dart';

class FoodProvider extends ChangeNotifier {
  List foods_menu = [];
  FoodProvider() {
    foods_menu = [];
  }

  loadAllFoodMenu() async {
    final result = await ActionMenu().getAllMenu();
    foods_menu = result;
    notifyListeners();
  }
}
