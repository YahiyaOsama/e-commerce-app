// ignore_for_file: avoid_print

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:purchases/controller/services/firestore_user.dart';
import 'package:purchases/model/user_model.dart';

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
  String? email, password, name, age, width, height;

  final Rx<User?> _user = Rx<User?>(null);

  String? get user => _user.value?.email;

  @override
  void onInit() {
    // _user.bindStream(_auth.authStateChanges());
    _user.value = _auth.currentUser;
    super.onInit();
  }

  void signInWithEmailAndPasswordFirebase(
      {required BuildContext context}) async {
    if (email == null ||
        email!.isEmpty && password == null ||
        password!.isEmpty) {
      Get.snackbar("Error", "Complete Your email and password..!");
      return;
    }
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      if (credential.user!.emailVerified) {
        Get.offNamed(StringsManager.startRoute);
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
    if (email == null ||
        email!.isEmpty && password == null ||
        password!.isEmpty) {
      return;
    }
    try {
      final cred = await _auth.createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      saveUser(cred);
      _auth.currentUser!.sendEmailVerification();
      Get.offNamed(StringsManager.loginRoute);
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
    await _auth.signInWithCredential(credential).then((user) => saveUser(user));
    Get.offNamed(StringsManager.startRoute);
  }

  //
  // Future<void> signInWithFacebookFirebase() async {
  //   final LoginResult loginResult = await _facebookAuth.login();
  //   final accessToken = loginResult.accessToken!.token;
  //   if(loginResult.status ==FacebookLoginStatues.loggedIn){
  //     final faceCredential = FacebookAuthProvider.credential(accessToken);
  //     await _auth.signInWithCredential(faceCredential).then((user) => saveUser(user));
  //   }
  //   final OAuthCredential facebookAuthCredential =
  //       FacebookAuthProvider.credential(loginResult.accessToken!.token);
  // }

  //
  Future<void> resetPasswordFirebase() async {
    print(email);
    if (email == null || email!.isEmpty) {
      return;
    }
    try {
      await _auth.sendPasswordResetEmail(email: email!);
      Get.snackbar(
        "Rest Password Email Send.",
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

  //
  Future<void> saveUser(UserCredential credential) async {
    await FirestoreUser().addUserToFireStore(UserModel(
      userId: credential.user!.uid,
      email: credential.user!.email,
      name: name ?? credential.user!.displayName,
      age: age ?? "",
      pic: "",
      height: height ?? "",
      width: width ?? "",
    ));
  }
}
