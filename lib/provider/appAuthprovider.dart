import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import '../Pages/homePage.dart';
import '../logi.dart';
import '../screens/registerScreen.dart';

class AppAuthProvider extends ChangeNotifier {
  GlobalKey<FormState>? formKey;
  TextEditingController? emailController;
  TextEditingController? passwordController;
  TextEditingController? nameController;
  bool obsecureText = false;

  void providerInit() {
    formKey = GlobalKey<FormState>();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameController = TextEditingController();
  }

  void providerDispose() {
    emailController = null;
    passwordController = null;
    formKey = null;
    nameController = null;
    obsecureText = false;
  }

  void toggleObsecure() {
    obsecureText = !obsecureText;
    notifyListeners();
  }

  void openRegisterPage(BuildContext context) {
    providerDispose();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => const RegisterPage()));
  }

  void openLoginPage(BuildContext context) {
    providerDispose();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => const LoginPage()));
  }

  Future<void> signUp(BuildContext context) async {
    try {
      if (formKey?.currentState?.validate() ?? false) {
        var credentials = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
            email: emailController!.text,
            password: passwordController!.text);

        if (credentials.user != null) {
          await credentials.user?.updateDisplayName(nameController!.text);
          providerDispose();
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => HomePage()));
        }
      }
    } catch (e) {}
  }
}