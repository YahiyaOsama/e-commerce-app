import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:purchases/view/control_view.dart';
import 'package:purchases/view/login_screen.dart';
import 'package:purchases/view/product_details.dart';
import 'package:purchases/view/res/strings_manager.dart';
import 'package:purchases/view/signup_screen.dart';
import 'package:purchases/view/home_screen.dart';
import 'controller/utils/binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
      ),
      home: const ControlView(),
      // home: const ProductDetails(),
      debugShowCheckedModeBanner: false,
      initialBinding: Binding(),
      getPages: [
        GetPage(
          name: StringsManager.startRoute,
          page: () => const ControlView(),
        ),
        GetPage(
          name: StringsManager.loginRoute,
          page: () => LoginScreen(),
        ),
        GetPage(
          name: StringsManager.signupRoute,
          page: () => SignupScreen(),
        ),
        GetPage(
          name: StringsManager.homeRoute,
          page: () => HomeScreen(),
        ),
        GetPage(
          name: StringsManager.productDetailsRoute,
          page: () => const ProductDetails(),
        ),
      ],
    );
  }
}
