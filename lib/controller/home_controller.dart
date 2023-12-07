import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:purchases/controller/services/home_services.dart';
import 'package:purchases/model/product_model.dart';

class HomeController extends GetxController {
  // DatabaseReference database =
  //     FirebaseDatabase.instance.ref().child('products');

  ValueNotifier<bool> get isLoading => _isLoading;
  final ValueNotifier<bool> _isLoading = ValueNotifier(false);

  List<ProductModel> get productModel => _productModel;
  final List<ProductModel> _productModel = [];

// Future<void> getItemsFromRealTimeDatabase() async {
//   DataSnapshot dataSnapshot = await database.get();
//   print(dataSnapshot.value);
// }

// getCategory() async {
//   if (categoryModel.isEmpty) {
//     return;
//   }
//   _isLoading.value = true;
//   HomeService().getCategory().then((value) {
//     for (int i = 0; i < value.length; i++) {
//       _categoryModel.add(ProductModel.fromJson(value[i].data() as Map));
//       _isLoading.value = false;
//     }
//     update();
//   });
// }
}
