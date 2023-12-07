import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:purchases/controller/auth_controller.dart';
import 'package:purchases/controller/main_controller.dart';
import 'package:purchases/view/login_screen.dart';

import 'res/assets_manager.dart';
import 'res/color_manager.dart';
import 'res/values_manager.dart';

class ControlView extends GetWidget<AuthController> {
  const ControlView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthController>().user == null)
          ? LoginScreen()
          : GetBuilder<MainController>(
              // id: 'rootContainerScreen',
              builder: (controller) {
                // print("Current Screen ${controller.currentScreen.runtimeType}");
                return Scaffold(
                  backgroundColor: Colors.white,
                  body: controller.currentScreen,
                  bottomNavigationBar: bottomNavigationBar(),
                );
              },
            );
    });
  }

  bottomNavigationBar() {
    return GetBuilder<MainController>(
      // id: 'bottomNavBarId',
      init: MainController(),
      builder: (controller) {
        return BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 5,
          selectedItemColor: ColorManager.blackColor,
          items: [
            BottomNavigationBarItem(
              activeIcon: const Padding(
                padding: EdgeInsets.only(top: 25),
                child: Text(
                  "Explore",
                  style: TextStyle(
                    fontSize: AppSiz.s16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              label: "",
              icon: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SvgPicture.asset(
                  AssetManager.bottomNavBarHomeIcon,
                  width: 20,
                ),
              ),
            ),
            BottomNavigationBarItem(
              activeIcon: const Padding(
                padding: EdgeInsets.only(top: 25),
                child: Text(
                  'Cart',
                  style: TextStyle(
                    fontSize: AppSiz.s16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              label: "",
              icon: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SvgPicture.asset(
                  AssetManager.bottomNavBarCartIcon,
                  width: 20,
                ),
              ),
            ),
            BottomNavigationBarItem(
              activeIcon: const Padding(
                padding: EdgeInsets.only(top: 25),
                child: Text(
                  "Profile",
                  style: TextStyle(
                    fontSize: AppSiz.s16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              label: "",
              icon: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SvgPicture.asset(
                  AssetManager.bottomNavBarProfileIcon,
                  width: 20,
                ),
              ),
            ),
          ],
          currentIndex: controller.navigatorValue,
          onTap: (i) {
            controller.changeSelectedValue(i);
          },
        );
      },
    );
  }
}
