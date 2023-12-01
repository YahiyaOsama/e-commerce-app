import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:purchases/controller/auth_controller.dart';
import 'package:purchases/view/res/extension.dart';
import '../res/assets_manager.dart';
import '../res/color_manager.dart';
import '../res/values_manager.dart';

class CustomSocialPart extends GetWidget<AuthController> {
  final String text;

  const CustomSocialPart({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
                color: ColorManager.textColor,
                fontWeight: FontWeight.w400,
                fontSize: AppSiz.s18),
          ),
        ),
        20.mh,
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.8,
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    controller.signInWithGoogleFirebase();
                  },
                  child: Container(
                    height: AppSiz.s50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSiz.s10),
                      color: ColorManager.whiteColor,
                      boxShadow: [
                        BoxShadow(
                          color:
                              ColorManager.blackColor.withOpacity(AppSiz.s0_1),
                          blurRadius: AppSiz.s10,
                        )
                      ],
                    ),
                    child: SvgPicture.asset(
                      AssetManager.googleLogo,
                      height: AppSiz.s20,
                    ),
                  ),
                ),
              ),
              10.pw,
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    // controller.signInWithFacebookFirebase();
                  },
                  child: Container(
                    height: AppSiz.s50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSiz.s10),
                      color: ColorManager.whiteColor,
                      boxShadow: [
                        BoxShadow(
                          color:
                              ColorManager.blackColor.withOpacity(AppSiz.s0_1),
                          blurRadius: AppSiz.s10,
                        )
                      ],
                    ),
                    child: SvgPicture.asset(
                      AssetManager.facebookLogo,
                      height: AppSiz.s20,
                    ),
                  ),
                ),
              ),
              10.pw,
              Expanded(
                child: Container(
                  height: AppSiz.s50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSiz.s10),
                    color: ColorManager.whiteColor,
                    boxShadow: [
                      BoxShadow(
                        color: ColorManager.blackColor.withOpacity(AppSiz.s0_1),
                        blurRadius: AppSiz.s10,
                      )
                    ],
                  ),
                  child: SvgPicture.asset(
                    AssetManager.githubLogo,
                    height: AppSiz.s20,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
