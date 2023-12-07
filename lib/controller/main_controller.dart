import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/cart_screen.dart';
import '../view/home_screen.dart';
import '../view/profile_screen.dart';

class MainController extends GetxController {
  get navigatorValue => _navValue;
  int _navValue = 0;

  Widget currentScreen = HomeScreen();

  void changeSelectedValue(int selectedValue) {
    _navValue = selectedValue;
    switch (selectedValue) {
      case 0:
        {
          currentScreen = HomeScreen();
          break;
        }
      case 1:
        {
          currentScreen = const CartScreen();
          break;
        }
      case 2:
        {
          currentScreen = const ProfileScreen();
          break;
        }
    }
    update();
  }
}
