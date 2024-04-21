import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  RxBool isLoading = false.obs;

  Future<void> signUpWithEmail(String email, String password) async {
    try {
      // Get the instance of FirebaseAuth

      // Use the createUserWithEmailAndPassword method to create a new user
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // User has been successfully created
      print(
          'User signed up successfully with email: ${userCredential.user!.email}');
      // You can perform any additional logic here (e.g., redirect to a home screen)
    } catch (e) {
      // Handle any errors that occur during sign-up
      print('Error signing up: $e');
    }
  }

  Future<void> loginUser(String email, String password) async {
    try {
      // Attempt to sign in with email and password.
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // If successful, you can use `userCredential` to access the user data.
      // For example, you might want to retrieve the user's ID:
      String userId = userCredential.user?.uid ?? 'Unknown user ID';

      // Handle successful login (e.g., navigate to a new screen).
      print('Login successful! User ID: $userId');

      // Perform additional operations upon successful login.
      // For example, navigate to the home screen:
      // Navigator.pushNamed(context, '/home');
    } on FirebaseAuthException catch (e) {
      // Handle login errors, such as invalid credentials.
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      } else {
        print('Login error: ${e.message}');
      }

      // Handle errors (e.g., display an error message to the user).
      // You can use a Snackbar, Dialog, or other UI elements to show errors.
    }
  }
}
