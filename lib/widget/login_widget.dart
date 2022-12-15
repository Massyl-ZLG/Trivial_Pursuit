import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/data/dataSources/repositories/question_repository.dart';
import 'package:test_flutter/widget/signup_widget.dart';

import '../main.dart';
import '../page/auth/login/forgot_password_page.dart';
import '../page/utils/utils.dart';

class LoginWidget extends StatefulWidget {
   final VoidCallback onClickedSignUp;

  const LoginWidget({
    Key? key,
    required this.onClickedSignUp,
  }) : super(key : key);
  @override
  State<LoginWidget> createState() => _LoginWidgetState();


}

class _LoginWidgetState extends State<LoginWidget> {


  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    padding : const EdgeInsets.all(16),
    child : Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 40),
        TextField(
          controller: emailController,
          cursorColor: Colors.white,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration( label  : Text('Email') ),
          obscureText: false,
        ),
        const SizedBox(height: 40),
        TextField(
          controller: passwordController,
          cursorColor: Colors.white,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(label  : Text('Password') ),
          obscureText: true,
        ),
        const SizedBox(height: 20),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(50),
          ),
          icon : const Icon(Icons.lock_open , size: 32),
          label: const Text(
            'Sign In',
            style : TextStyle(fontSize: 24),
          ),
          onPressed: () => signIn(context),
        ),
        const SizedBox(height: 20),
        GestureDetector(
          child: Text(
            'Forgot Password?',
            style : TextStyle(
              decoration: TextDecoration.underline,
              color : Theme.of(context).colorScheme.primary,
              fontSize: 20,
            ),
          ),
          onTap : () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ForgotPasswordPage())),
          ),
        const SizedBox(height: 16),
        const SizedBox(height: 20),
        InkWell(
          onTap:   widget.onClickedSignUp,
          child : const  Text(
              'Sign Up',
              style : TextStyle(
                  decoration: TextDecoration.underline,
                  color : Colors.lightBlue
              )
          )
        ),
      ],
    )
  );

  Future signIn(context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email : emailController.text.trim(),
        password : passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      Utils.showSnackBar(e.message);
    }
    context.goNamed('game');
  }
}
