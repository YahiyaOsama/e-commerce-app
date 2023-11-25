import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:purchases/view/res/strings_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        actions: [
          IconButton(
              onPressed: () {
                Get.offAllNamed(StringsManager.loginRoute);
              },
              icon: const Icon(Icons.login_sharp))
        ],
      ),
    );
  }
}
