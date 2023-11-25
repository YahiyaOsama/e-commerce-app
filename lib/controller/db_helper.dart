import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/res/strings_manager.dart';

enum AuthStatues {
  successful,
  wrongPassword,
  emailAlreadyExists,
  invalidEmail,
  weakPassword,
  unknown,
}

class AuthExceptionHandler {
  static handleAuthException(FirebaseAuthException e) {
    AuthStatues statues;
    switch (e.code) {
      case "invalid-email":
        statues = AuthStatues.invalidEmail;
        break;
      case "wrong-password":
        statues = AuthStatues.wrongPassword;
        break;
      case "email-already-in-use":
        statues = AuthStatues.emailAlreadyExists;
        break;
      case "weak-password":
        statues = AuthStatues.weakPassword;
        break;
    }
  }

  static String generateErrorMessage(error) {
    String errorMessage;
    switch (error) {
      case AuthStatues.invalidEmail:
        errorMessage = "Your email address invalid";
        break;
      case AuthStatues.weakPassword:
        errorMessage = "The password provided is too weak.";
        break;
      case AuthStatues.wrongPassword:
        errorMessage = "Your email or password is wrong ";
        break;
      case AuthStatues.emailAlreadyExists:
        errorMessage = "The account already exists for that email.";
        break;
      default:
        errorMessage = "There is an error , please try again later";
    }
    return errorMessage;
  }
}

class AuthenticationHelper {
  final _auth = FirebaseAuth.instance;

  Future signUpWithFirebase({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      _auth.currentUser!.sendEmailVerification();
      Get.offAllNamed(StringsManager.loginRoute);
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future signInWithFirebase({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user!.emailVerified) {
        Get.offNamed(StringsManager.homeRoute);
      } else {
        // ignore: use_build_context_synchronously
        AwesomeDialog(
          context: context,
          dialogType: DialogType.info,
          animType: AnimType.rightSlide,
          title: 'Please verify you account...!',
        ).show();
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future resetPassword({required String email}) async {
    dynamic statues;
    await _auth
        .sendPasswordResetEmail(email: email)
        .then((value) => statues = AuthStatues.successful)
        .catchError((e) => AuthExceptionHandler.handleAuthException(e));
    return statues;
  }
}
