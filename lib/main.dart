import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:purchases/view/login_screen.dart';
import 'package:purchases/view/res/strings_manager.dart';
import 'package:purchases/view/res/values_manager.dart';
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
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.grey.withOpacity(AppSiz.s0_1)));
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: (FirebaseAuth.instance.currentUser != null &&
                FirebaseAuth.instance.currentUser!.emailVerified)
            ? StringsManager.homeRoute
            : StringsManager.loginRoute,
        initialBinding: Binding(),
        getPages: [
          GetPage(
            name: StringsManager.loginRoute,
            page: () => LoginScreen(),
            binding: Binding(),
          ),
          GetPage(
            name: StringsManager.signupRoute,
            page: () => SignupScreen(),
            binding: Binding(),
          ),
          GetPage(
            name: StringsManager.homeRoute,
            page: () => const HomeScreen(),
            binding: Binding(),
          ),
        ]);
  }
}
