import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:purchases/controller/home_controller.dart';
import 'package:purchases/view/res/assets_manager.dart';
import 'package:purchases/view/res/color_manager.dart';
import 'package:purchases/view/res/extension.dart';
import 'package:purchases/view/res/strings_manager.dart';
import 'package:purchases/view/res/values_manager.dart';

class HomeScreen extends GetWidget<HomeController> {
  HomeScreen({super.key});

  FirebaseAuth auth = FirebaseAuth.instance;
  final List<String> names = <String>[
    'Men',
    'Woman',
    'Devices',
    'Gadgets',
    'Gaming',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p19,
            vertical: AppPadding.p13,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              10.mh,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Home Screen"),
                  IconButton(
                      onPressed: () {
                        auth.signOut();
                        Get.offNamed(StringsManager.loginRoute);
                      },
                      icon: const Icon(Icons.login_sharp))
                ],
              ),
              20.mh,
              searchSection(),
              30.mh,
              const Text(
                "Categories",
                style: TextStyle(
                  fontSize: AppSiz.s20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              20.mh,
              categoriesSection(),
              10.mh,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Best Selling",
                    style: TextStyle(
                      color: ColorManager.blackColor,
                      fontSize: AppSiz.s18,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: GestureDetector(
                      onTap: () {},
                      child: Text(
                        "See All",
                        style: TextStyle(
                          color: ColorManager.primary.withOpacity(0.7),
                          fontSize: AppSiz.s18,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              5.mh,
              productSection(),
            ],
          ),
        ),
      ),
    );
  }

  searchSection() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p9,
        vertical: AppSiz.s4,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(50),
      ),
      child: TextFormField(
        style: const TextStyle(),
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
          suffixIcon: Icon(Icons.search),
          hintText: "Search here...",
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 12, left: 10),
          hintStyle: TextStyle(height: AppSiz.s1),
        ),
      ),
    );
  }

  categoriesSection() {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        itemCount: names.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) {
          return Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSiz.s50),
                  color: Colors.grey.shade100,
                ),
                height: 70,
                width: 70,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(AssetManager.iconMensShoe),
                ),
              ),
              15.mh,
              Text(names[i]),
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) => 20.mw,
      ),
    );
  }

  productSection() {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      height: 300,
      child: ListView.separated(
        itemCount: names.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 220,
                child: Image.asset(
                  AssetManager.oneProduct,
                  fit: BoxFit.cover,
                ),
              ),
              10.mh,
              Text(
                "Beoplay Speaker",
                style: TextStyle(
                  fontSize: AppSiz.s18,
                  fontWeight: FontWeight.w500,
                  color: ColorManager.blackColor,
                ),
              ),
              2.mh,
              Text(
                "Bang and Olufsen",
                style: TextStyle(
                  fontSize: AppSiz.s16,
                  fontWeight: FontWeight.w400,
                  color: ColorManager.textColor,
                ),
              ),
              2.mh,
              Text(
                "755 EGP",
                style: TextStyle(
                  fontSize: AppSiz.s16,
                  fontWeight: FontWeight.w400,
                  color: ColorManager.primary.withOpacity(0.7),
                ),
              ),
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) => 20.mw,
      ),
    );
  }
}
