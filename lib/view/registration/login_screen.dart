// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:purchases/controller/auth_controller.dart';
import 'package:purchases/view/res/assets_manager.dart';
import 'package:purchases/view/res/color_manager.dart';
import 'package:purchases/view/res/extension.dart';
import 'package:purchases/view/res/values_manager.dart';
import 'package:purchases/view/widgets/custom_social_part.dart';
import '../res/strings_manager.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_clipper.dart';
import '../widgets/custom_text_field.dart';

class LoginScreen extends GetWidget<AuthController> {
  LoginScreen({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.grey.withOpacity(AppSiz.s0_1)));
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              ClipPath(
                clipper: BackgroundClipper(),
                child: Container(
                  color: Colors.grey.withOpacity(AppSiz.s0_1),
                  height: AppSiz.s180,
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(AppPadding.p15),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: AppPadding.p11),
                        alignment: Alignment.center,
                        child: const Image(
                          image: AssetImage(AssetManager.appLogo),
                          width: AppSiz.s200,
                          height: AppSiz.s80,
                        ),
                      ),
                      AppSiz.s70.mh,
                      Container(
                        padding: const EdgeInsets.only(left: AppPadding.p13),
                        child: Text(
                          'Sign in to your account',
                          style: TextStyle(
                              color: ColorManager.textColor,
                              fontWeight: FontWeight.w600,
                              fontSize: AppSiz.s20),
                        ),
                      ),
                      AppSiz.s30.mh,
                      CustomTextFormField(
                        text: 'Email',
                        textInputType: TextInputType.emailAddress,
                        obscure: false,
                        textEditingController: emailController,
                        onChange: (value) {
                          controller.email = value!;
                          print(controller.email);
                        },
                        validator: (value) {
                          if (value == null) {
                            print("email error");
                          }
                          return null;
                        },
                      ),
                      AppSiz.s30.mh,
                      CustomTextFormField(
                        text: 'Password',
                        textInputType: TextInputType.visiblePassword,
                        obscure: true,
                        onChange: (value) {
                          controller.password = value!;
                        },
                        validator: (value) {
                          if (value == null) {
                            print("error");
                          }
                          return null;
                        },
                      ),
                      AppSiz.s10.mh,
                      InkWell(
                        onTap: () {
                          controller.resetPasswordFirebase();
                        },
                        child: Container(
                            padding: const EdgeInsets.only(
                                right: 10, top: 10, bottom: 10),
                            alignment: Alignment.topRight,
                            child: Text(
                              "Forget password ?",
                              style: TextStyle(
                                fontSize: 18,
                                color: ColorManager.textColor,
                              ),
                            )),
                      ),
                      AppSiz.s20.mh,
                      Container(
                        alignment: Alignment.center,
                        child: CustomButton(
                          text: 'Sign In',
                          textColor: ColorManager.whiteColor,
                          onPressed: () {
                            formKey.currentState!.save();
                            if (formKey.currentState!.validate()) {
                              controller.signInWithEmailAndPasswordFirebase(
                                  context: context);
                            }
                          },
                        ),
                      ),
                      50.mh,
                      const CustomSocialPart(text: "- Or Sign in with -"),
                      40.mh,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: TextStyle(
                                color: ColorManager.textColor,
                                fontWeight: FontWeight.w600,
                                fontSize: AppSiz.s16),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(StringsManager.signupRoute);
                            },
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                  color: ColorManager.primary,
                                  fontSize: AppSiz.s16,
                                  fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
