// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../view/res/color_manager.dart';
// import '../view/res/strings_manager.dart';
//
// class RegistrationController extends GetxController {
//   final formKey = GlobalKey<FormState>();
//
//   validateEmail(String? email) {
//     if (!GetUtils.isEmail(email ?? '')) {
//       return "";
//     }
//     return null;
//   }
//
//   validatePassword(String? pass) {
//     if (!GetUtils.isLengthGreaterOrEqual(pass, 6)) {
//       return "";
//     }
//     return null;
//   }
//
//   Future onLogin() async {
//     if (formKey.currentState!.validate()) {
//       // Get.toNamed(StringsManager.splashRoute);
//       return null;
//     }
//     Get.snackbar(
//       "Error",
//       'login field',
//       snackPosition: SnackPosition.BOTTOM,
//       colorText: ColorManager.whiteColor,
//       backgroundColor: ColorManager.primary,
//       margin: const EdgeInsets.only(bottom: 10, left: 30, right: 30),
//       borderRadius: 20,
//       maxWidth: 180,
//     );
//   }
//
//   Future resetPassword(TextEditingController controller) async {
//     await FirebaseAuth.instance.sendPasswordResetEmail(
//       email: controller.text,
//     );
//   }
//
// }
