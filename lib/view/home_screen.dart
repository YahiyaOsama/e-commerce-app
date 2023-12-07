import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:purchases/controller/home_controller.dart';
import 'package:purchases/view/res/assets_manager.dart';
import 'package:purchases/view/res/color_manager.dart';
import 'package:purchases/view/res/extension.dart';
import 'package:purchases/view/res/values_manager.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<String> names = <String>[
    'Men',
    'Woman',
    'Devices',
    'Gadgets',
    'Gaming',
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.white));

    return GetBuilder<HomeController>(
      init: Get.find<HomeController>(),
      builder: (controller) {
        return controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : SafeArea(
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: AppPadding.p19,
                      right: AppPadding.p19,
                      top: AppPadding.p13,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Hi Yahiya,",
                              style: TextStyle(
                                fontSize: AppSiz.s25,
                                fontWeight: FontWeight.w600,
                                color: ColorManager.textColor,
                              ),
                            ),
                            Container(
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Image.asset(
                                AssetManager.profileAvatar,
                                width: 50,
                              ),
                            ),
                          ],
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     const Text("Home Screen"),
                        //     IconButton(
                        //         onPressed: () {
                        //           auth.signOut();
                        //           Get.offNamed(StringsManager.loginRoute);
                        //         },
                        //         icon: const Icon(Icons.login_sharp))
                        //   ],
                        // ),
                        // searchSection(),
                        15.mh,
                        const Text(
                          "Recommendations",
                          style: TextStyle(
                            fontSize: AppSiz.s20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        15.mh,
                        productSection(),
                        20.mh,
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
                              padding:
                                  const EdgeInsets.only(left: 20, right: 15),
                              child: GestureDetector(
                                onTap: () {},
                                child: Text(
                                  "See All",
                                  style: TextStyle(
                                    color:
                                        ColorManager.primary.withOpacity(0.7),
                                    fontSize: AppSiz.s18,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        15.mh,
                        productSection(),
                      ],
                    ),
                  ),
                ),
              );
      },
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

  productSection() {
    return Container(
      padding: const EdgeInsets.only(left: 5, right: 5),
      height: 280,
      child: ListView.separated(
        itemCount: names.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 200,
                child: Image.asset(
                  AssetManager.oneProduct,
                  fit: BoxFit.cover,
                ),
              ),
              10.mh,
              Text(
                "Beoplay Speaker",
                style: TextStyle(
                  fontSize: AppSiz.s16,
                  fontWeight: FontWeight.w500,
                  color: ColorManager.blackColor,
                ),
              ),
              2.mh,
              Text(
                "Bang and Olufsen",
                style: TextStyle(
                  fontSize: AppSiz.s14,
                  fontWeight: FontWeight.w400,
                  color: ColorManager.textColor,
                ),
              ),
              2.mh,
              Text(
                "755 EGP",
                style: TextStyle(
                  fontSize: AppSiz.s14,
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
