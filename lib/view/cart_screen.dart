// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:purchases/view/res/assets_manager.dart';
import 'package:purchases/view/res/color_manager.dart';
import 'package:purchases/view/res/extension.dart';
import 'package:purchases/view/res/values_manager.dart';
import 'package:purchases/view/widgets/custom_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> nameList = [
      "The Heuer WristWatch",
      "BeoPlay Speaker",
      "Electric Kettle",
      "BeoPlay Speaker",
      "BeoPlay Speaker",
    ];
    List<String> imgList = [
      AssetManager.product,
      AssetManager.product,
      AssetManager.product,
      AssetManager.product,
      AssetManager.product,
    ];
    List<int> priceList = [
      100,
      200,
      300,
      400,
      500,
    ];

    return Column(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(
              right: AppPadding.p15,
              left: AppPadding.p15,
              top: AppPadding.p19,
            ),
            child: ListView.separated(
              itemBuilder: (_, i) {
                return Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(AppSiz.s18),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 141,
                        child: Image.asset(
                          imgList[i],
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: AppPadding.p19,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              nameList[i],
                              style: TextStyle(
                                fontSize: AppSiz.s18,
                                fontWeight: FontWeight.w500,
                                color: ColorManager.textColor,
                              ),
                            ),
                            5.mh,
                            Text(
                              "\$${priceList[i]}",
                              style: TextStyle(
                                fontSize: AppSiz.s20,
                                fontWeight: FontWeight.w700,
                                color: ColorManager.primary.withOpacity(0.6),
                              ),
                            ),
                            5.mh,
                            Container(
                              margin: const EdgeInsets.only(left: 40),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onPressed: () {
                                      print("add");
                                    },
                                    icon: const Icon(
                                      Icons.add,
                                    ),
                                  ),
                                  5.mw,
                                  Text(
                                    "1",
                                    style: TextStyle(
                                      fontSize: AppSiz.s18,
                                      color: ColorManager.textColor,
                                    ),
                                  ),
                                  5.mw,
                                  Container(
                                    padding: const EdgeInsets.only(bottom: 15),
                                    child: IconButton(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onPressed: () {
                                        print("mines");
                                      },
                                      icon: const Icon(
                                        Icons.minimize_outlined,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ), // child: ,
                );
              },
              itemCount: nameList.length,
              separatorBuilder: (BuildContext context, int index) => 20.mh,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: ColorManager.textColor,
                    ),
                  ),
                  2.mh,
                  Text(
                    "\$2000",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: ColorManager.primary.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 150,
                child: CustomButton(
                  text: "CheckOut",
                  textColor: Colors.white,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
