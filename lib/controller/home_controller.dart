// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:purchases/controller/services/home_services.dart';
import 'package:purchases/model/product_model.dart';
import '../model/category_model.dart';

class HomeController extends GetxController {
  ValueNotifier<bool> get isLoading => _isLoading;
  final ValueNotifier<bool> _isLoading = ValueNotifier(false);

  List<ProductModel> get productModel => _productModel;
  final List<ProductModel> _productModel = [];

  List<CategoryModel> get categoryModel => _categoryModel;
  final List<CategoryModel> _categoryModel = [];

  HomeController() {
    getCategory();
    getBestSellingProducts();
  }

  getCategory() async {
    _isLoading.value = true;
    HomeService().getCategory().then((value) {
      for (int i = 0; i < value.length; i++) {
        _categoryModel.add(CategoryModel.fromJson(value[i].data() as Map));
        _isLoading.value = false;
        // print(_categoryModel.length);
      }
      update();
    });
  }

  getBestSellingProducts() async {
    _isLoading.value = true;
    HomeService().getBestSelling().then((value) {
      for (int i = 0; i < value.length; i++) {
        _productModel.add(ProductModel.fromJson(value[i].data() as Map));
        _isLoading.value = false;
      }
      print("---- product elements is : ${_productModel.length}");
      update();
    });
  }

// Future<void> getItemsFromRealTimeDatabase() async {
//   DataSnapshot dataSnapshot = await database.get();
//   print(dataSnapshot.value);
// }
}
