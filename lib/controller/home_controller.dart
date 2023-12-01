import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/cart_screen.dart';
import '../view/home_screen.dart';
import '../view/profile_screen.dart';

class HomeController extends GetxController {
  int _navValue = 0;

  get navValue => _navValue;
  Widget _currentScreen = HomeScreen();

  get currentScreen => _currentScreen;

  void changeSelectedValue(int selectedValue) {
    _navValue = selectedValue;
    switch (selectedValue) {
      case 0:
        _currentScreen = HomeScreen();
        break;
      case 1:
        _currentScreen = const CartScreen();
        break;
      case 2:
        _currentScreen = const ProfileScreen();
        break;
    }
    update(['rootContainerScreen', 'bottomNavBarId']);
  }
}
