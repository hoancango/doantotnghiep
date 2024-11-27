import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ValidateController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late SharedPreferences prefs;

  Rx<UserCredential?> credentialSignUp = Rxn<UserCredential>();
  Rx<UserCredential?> credentialLogIn = Rxn<UserCredential>();
  Rx<UserCredential?> credentialGoogleLogIn = Rxn<UserCredential>();

  RxBool isLoading = false.obs;
  RxBool isChecked = false.obs;

  int touchCount = 0;

  @override
  Future<void> onInit() async {
    super.onInit();
    prefs = await SharedPreferences.getInstance();
    bool? userSaveChoice = prefs.getBool('isChecked');
    if (userSaveChoice != null) {
      isChecked.value = userSaveChoice;
    }
    print('gia tri ban dau cua isChecked la: ${isChecked.value}');

  }

  bool isValidEmail(String input) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(input);
  }

  bool isValidPassword(String input) {
    RegExp basic = RegExp(r'^([a-zA-Z\d\W]{6,})$');
    //testing...
    RegExp advance = RegExp(r'^([^[^a-z]{6,}[^A-Z]{6,}\D{6,}\W{6,}])$');
    return basic.hasMatch(input);
  }

  Future<void> createUserWithEmailAndPassword(
      String emailAddress, String password) async {
    try {
      isLoading.value = true;
      credentialSignUp.value =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      if (credentialSignUp.value?.user != null) {
        print(credentialSignUp.value);
        isLoading.value = false;
      }
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      if (e.code == 'weak-password') {
        Get.snackbar(
          'Error loading data',
          'The password provided is too weak.',
          backgroundColor: Colors.white,
        );
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar(
          'Error loading data',
          'The account already exists for that email.',
          backgroundColor: Colors.white,
        );
      } else {
        Get.snackbar(
          'Error',
          'An unknown error occurred: ${e.message}',
          backgroundColor: Colors.white,
        );
      }
    } catch (e) {
      isLoading.value = false;
      print(e);
      Get.snackbar(
        'Error loading data',
        'Error occurs',
        backgroundColor: Colors.white,
      );
    }
  }

  Future<void> signInWithEmailAndPassword(
      String emailAddress, String password) async {
    try {
      isLoading.value = true;
      credentialLogIn.value =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      if (credentialLogIn.value?.user != null) {
        print(credentialLogIn.value);
        isLoading.value = false;
      }
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      if (e.code == 'user-not-found') {
        print('Lỗi Firebase: ${e.code}');
        Get.snackbar(
          'Error loading data',
          'No user found for that email.',
          backgroundColor: Colors.white,
        );
      } else if (e.code == 'wrong-password') {
        print('Lỗi Firebase: ${e.code}');
        Get.snackbar(
          'Error loading data',
          'Wrong password provided for that user.',
          backgroundColor: Colors.white,
        );
      }
    } catch (e) {
      isLoading.value = false;
      print('$e');
      Get.snackbar(
        'Error loading data',
        'Error occurs',
        backgroundColor: Colors.white,
      );
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      isLoading.value = true;
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credentialGoogle = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      credentialGoogleLogIn.value =
          await FirebaseAuth.instance.signInWithCredential(credentialGoogle);

      if (credentialGoogleLogIn.value?.user != null) {
        print(credentialGoogleLogIn.value);
        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;
      print('$e');
      Get.snackbar(
        'Error loading data',
        'Error occurs: $e',
        backgroundColor: Colors.white,
      );
    }
  }

  Future<void> saveAccountAndUserChoice({String? user, String? password, required bool isChecked}) async {
      if (isChecked == true && user != null && password != null) {
        await prefs.setStringList('LastAccount', <String>[
          user,
          password,
        ]);
      }
    await prefs.setBool('isChecked', isChecked);
  }

  Future<List<String>?> readAccount() async {
    final List<String>? lastAccount = prefs.getStringList('LastAccount');
    return lastAccount;
  }




}
