import 'package:flutter/material.dart';
import 'package:purchases/view/res/assets_manager.dart';
import 'package:purchases/view/res/color_manager.dart';
import 'package:purchases/view/res/extension.dart';
import 'package:purchases/view/res/values_manager.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                )),
                child: Stack(
                  children: [
                    Image.asset(
                      AssetManager.product,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_back_ios),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: ColorManager.whiteColor,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            padding: const EdgeInsets.only(),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.favorite_border_outlined),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              10.mh,
              Container(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 5, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nike Dri-FIT Long Sleeve",
                      style: TextStyle(
                          fontSize: AppSiz.s25,
                          fontWeight: FontWeight.w700,
                          color: ColorManager.textColor),
                    ),
                    20.mh,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 11,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: ColorManager.textColor),
                          ),
                          width: MediaQuery.sizeOf(context).width * 0.4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Size",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: ColorManager.textColor,
                                ),
                              ),
                              Text(
                                "Xl",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: ColorManager.blackColor,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: ColorManager.textColor),
                          ),
                          width: MediaQuery.sizeOf(context).width * 0.4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Color",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: ColorManager.textColor,
                                ),
                              ),
                              Container(
                                width: 27,
                                height: 27,
                                decoration: BoxDecoration(
                                  color: ColorManager.primary,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    25.mh,
                    
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
