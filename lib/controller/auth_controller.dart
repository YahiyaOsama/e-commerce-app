// ignore_for_file: avoid_print

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../view/res/strings_manager.dart';

enum AuthStatues {
  successful,
  wrongPassword,
  emailAlreadyExists,
  invalidEmail,
  weakPassword,
  unknown,
}

class AuthController extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FacebookAuth _facebookAuth = FacebookAuth.instance;
  late String email, password, name, age, width, height;

  // late int age, width, height;

  void signInWithEmailAndPasswordFirebase(
      {required BuildContext context}) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user!.emailVerified) {
        Get.offNamed(StringsManager.homeRoute);
      } else {
        // ignore: use_build_context_synchronously
        AwesomeDialog(
          autoHide: const Duration(seconds: 3),
          context: context,
          dialogType: DialogType.info,
          animType: AnimType.rightSlide,
          title: 'Please verify your account...!',
        ).show();
      }
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "Error login account",
        e.message!,
        margin: const EdgeInsets.only(left: 13, right: 13, bottom: 10),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  //
  Future<void> createAccountWithEmailAndPasswordFirebase() async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      _auth.currentUser!.sendEmailVerification();
      Get.offAllNamed(StringsManager.loginRoute);
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "Error During Create Account..!",
        e.message!,
        margin: const EdgeInsets.only(left: 13, right: 13, bottom: 10),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  //
  Future<void> signInWithGoogleFirebase() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    print(googleUser);
    if (googleUser == null) {
      return;
    }
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await _auth.signInWithCredential(credential);
    Get.offNamed(StringsManager.homeRoute);
  }

  //
  Future<UserCredential> signInWithFacebookFirebase() async {
    final LoginResult loginResult = await _facebookAuth.login();
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  //
  Future<void> resetPasswordFirebase() async {
    if (email.isEmpty) {
      return;
    }
    try {
      await _auth.sendPasswordResetEmail(email: email);
      Get.snackbar(
        "",
        "Check Your Email Please..!",
        margin: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
        // maxWidth: 200,
      );
    } catch (e) {
      Get.snackbar(
        "Error During reset Password..!",
        e.toString(),
        margin: const EdgeInsets.only(left: 13, right: 13, bottom: 15),
        snackPosition: SnackPosition.TOP,
      );
    }
  }
}
