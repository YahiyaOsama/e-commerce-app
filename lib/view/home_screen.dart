import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:purchases/controller/home_controller.dart';
import 'package:purchases/view/res/assets_manager.dart';
import 'package:purchases/view/res/color_manager.dart';
import 'package:purchases/view/res/extension.dart';
import 'package:purchases/view/res/values_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                top: 27,
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
                  40.mh,
                  Text(
                    "Recommendations",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: ColorManager.blackColor,
                      fontSize: AppSiz.s18,
                    ),
                  ),
                  25.mh,
                  categorySection(),
                  50.mh,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Best Selling",
                        style: TextStyle(
                          color: ColorManager.blackColor,
                          fontSize: AppSiz.s18,
                          fontWeight: FontWeight.w600,
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
                  25.mh,
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

  categorySection() {
    return GetBuilder<HomeController>(
      builder: (controller) =>
          Container(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p11),
            height: 100,
            child: ListView.separated(
              itemCount: controller.categoryModel.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSiz.s50),
                        color: Colors.grey.shade100,
                      ),
                      height: AppSiz.s50,
                      width: AppSiz.s50,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child:
                        Image.network(controller.categoryModel[index].image!),
                      ),
                    ),
                    20.mh,
                    Text(
                      controller.categoryModel[index].name!,
                      style: TextStyle(
                        color: ColorManager.textColor,
                        fontSize: AppSiz.s18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) => 40.mw,
            ),
          ),
    );
  }

  productSection() {
    return GetBuilder<HomeController>(
      builder: (controller) =>
          SizedBox(
            height: 330,
            child: ListView.separated(
              itemCount: controller.productModel.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Get.to();
                  },
                  child: SizedBox(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * .5,
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                        bottom: 10,
                        top: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade50,
                            blurRadius: 0.5,
                          )
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              alignment: Alignment.centerRight,
                              height: 220,
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width * .4,
                              child: Image.network(
                                controller.productModel[index].image!,
                                fit: BoxFit.cover,
                              )),
                          10.mh,
                          Text(
                            controller.productModel[index].name!,
                            style: TextStyle(
                              fontSize: AppSiz.s16,
                              fontWeight: FontWeight.w800,
                              color: ColorManager.blackColor,
                            ),
                          ),
                          10.mh,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Price ${controller.productModel[index]
                                    .price}\$",
                                style: TextStyle(
                                  fontSize: AppSiz.s18,
                                  fontWeight: FontWeight.w600,
                                  color: ColorManager.primary.withOpacity(0.7),
                                ),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                      Icons.favorite_border_outlined)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => 20.mw,
            ),
          ),
    );
  }
}

// Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       clipBehavior: Clip.antiAlias,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                         color: Colors.grey.shade100,
//                       ),
//                       child: SizedBox(
//                           height: 220,
//                           width: MediaQuery.of(context).size.width * .4,
//                           child: Image.network(
//                             controller.productModel[index].image!,
//                             fit: BoxFit.cover,
//                           )),
//                     ),
//                     20.mh,
//                     Text(
//                       controller.productModel[index].name!,
//                       style: TextStyle(
//                         fontSize: AppSiz.s18,
//                         fontWeight: FontWeight.w500,
//                         color: ColorManager.blackColor,
//                       ),
//                     ),
//                     10.mh,
//                     Text(
//                       controller.productModel[index].sized!,
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: AppSiz.s25,
//                         fontWeight: FontWeight.w300,
//                         color: ColorManager.textColor,
//                       ),
//                     ),
//                     20.mh,
//                     Text(
//                       "${controller.productModel[index].price} \$",
//                       style: TextStyle(
//                         fontSize: AppSiz.s14,
//                         fontWeight: FontWeight.w400,
//                         color: ColorManager.primary.withOpacity(0.7),
//                       ),
//                     ),
//                   ],
//                 ),
