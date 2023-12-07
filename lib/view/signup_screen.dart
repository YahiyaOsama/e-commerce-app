// ignore_for_file: avoid_print
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:purchases/controller/auth_controller.dart';
import 'package:purchases/view/res/assets_manager.dart';
import 'package:purchases/view/res/color_manager.dart';
import 'package:purchases/view/res/extension.dart';
import 'package:purchases/view/res/strings_manager.dart';
import 'package:purchases/view/res/values_manager.dart';
import 'package:purchases/view/widgets/custom_button.dart';
import 'package:purchases/view/widgets/custom_text_field.dart';

import 'widgets/custom_clipper.dart';

class SignupScreen extends GetWidget<AuthController> {
  SignupScreen({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  File? file;

  getImage() async {
    final imageGallery =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    file = File(imageGallery!.path);
  }

  @override
  Widget build(BuildContext context) {
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
                  height: 160.0,
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.offNamed(StringsManager.loginRoute);
                            },
                            child: Container(
                              padding: const EdgeInsets.only(
                                left: 10,
                                top: 10,
                                bottom: 10,
                              ),
                              child: const Icon(Icons.arrow_back_ios),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: const Image(
                              image: AssetImage("assets/images/logo.png"),
                              width: 200,
                              height: 70,
                            ),
                          ),
                        ],
                      ),
                      60.mh,
                      GetBuilder<AuthController>(
                        builder: (controller) {
                          return GestureDetector(
                            onTap: () async {
                              await controller.chooseImageFromGallery();
                              print("picked image Know");
                            },
                            child: Container(
                              alignment: Alignment.center,
                              child: Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  Container(
                                    width: 100,
                                    height: 100,
                                    decoration: const BoxDecoration(
                                      color: Colors.transparent,
                                    ),
                                    child: controller.profileImage == null
                                        ? const Image(
                                            image: AssetImage(
                                                AssetManager.profileAvatar),
                                          )
                                        : ClipRect(
                                            clipBehavior: Clip.antiAlias,
                                            child: Container(
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                              ),
                                              child: Image.file(
                                                fit: BoxFit.cover,
                                                isAntiAlias: true,
                                                controller.profileImage!,
                                              ),
                                            )),
                                  ),
                                  Container(
                                    width: 35,
                                    height: 35,
                                    decoration: BoxDecoration(
                                        color: ColorManager.whiteColor,
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child:
                                        const Icon(Icons.camera_alt_outlined),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      40.mh,
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextFormField(
                              text: 'Enter Your name',
                              textInputType: TextInputType.name,
                              obscure: false,
                              onChange: (value) {
                                controller.name = value!;
                              },
                              validator: (value) {
                                if (value == null) {
                                  print("name error");
                                }
                                return;
                                // if (value!.isEmpty ||
                                //     RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                                //   // Get.snackbar("Error", "Enter Correct Name");
                                //   return "Enter Correct Name";
                                // } else {
                                //   return null;
                                // }
                              },
                            ),
                          ),
                          15.pw,
                          Expanded(
                            child: CustomTextFormField(
                              text: 'Enter Your Age',
                              textInputType: TextInputType.datetime,
                              obscure: false,
                              onChange: (value) {
                                controller.age = value!;
                              },
                              validator: (value) {
                                if (value == null) {
                                  print("age error");
                                }
                                return;
                              },
                            ),
                          ),
                        ],
                      ),
                      20.mh,
                      CustomTextFormField(
                        text: 'Enter your email',
                        textInputType: TextInputType.emailAddress,
                        obscure: false,
                        onChange: (value) {
                          controller.email = value!;
                        },
                        validator: (value) {
                          if (value == null) {
                            print("email error");
                          }
                          return;
                        },
                      ),
                      20.mh,
                      CustomTextFormField(
                        text: 'Enter Your password',
                        textInputType: TextInputType.visiblePassword,
                        obscure: true,
                        onChange: (value) {
                          controller.password = value!;
                        },
                        validator: (value) {
                          if (value == null) {
                            print("password error");
                          }
                          return;
                        },
                      ),
                      20.mh,
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextFormField(
                              text: 'Enter your weight',
                              textInputType: TextInputType.number,
                              obscure: false,
                              onChange: (value) {
                                controller.weight = value!;
                              },
                              validator: (value) {
                                if (value == null) {
                                  print("weight error");
                                }
                                return;
                              },
                            ),
                          ),
                          15.pw,
                          Expanded(
                            child: CustomTextFormField(
                              text: 'Enter Your Height',
                              textInputType: TextInputType.number,
                              obscure: false,
                              onChange: (value) {
                                controller.height = value!;
                              },
                              validator: (value) {
                                if (value == null) {
                                  print("height error");
                                }
                                return;
                              },
                            ),
                          ),
                        ],
                      ),
                      40.mh,
                      Container(
                        alignment: Alignment.center,
                        child: CustomButton(
                          text: 'Sign up',
                          textColor: ColorManager.whiteColor,
                          onPressed: () {
                            formKey.currentState!.save();
                            if (formKey.currentState!.validate()) {
                              controller
                                  .createAccountWithEmailAndPasswordFirebase();
                            }
                          },
                        ),
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
