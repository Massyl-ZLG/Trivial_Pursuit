import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../model/trivial_user.dart';
import '../page/utils/utils.dart';

class SignUpWidget extends StatefulWidget {

  final VoidCallback onClickedSignIn;

  const SignUpWidget({
    Key? key,
    required this.onClickedSignIn,
  }) : super(key: key);

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final nicknameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController =  TextEditingController();

  @override
  void dispose(){
    emailController.dispose();
    nicknameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
      padding : const EdgeInsets.all(16),
      child : Form (
        key : formKey,
        child :    Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            TextFormField(
              controller: nicknameController,
              cursorColor: Colors.white,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration( label  : Text('Nickname *') ),
              obscureText: false,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (nickname) =>
              nickname == null
                  ? 'Enter a valid nickname'
                  : null,
            ),
            const SizedBox(height: 40),
            TextFormField(
              controller: emailController,
              cursorColor: Colors.white,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration( label  : Text('Email *') ),
              obscureText: false,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (email) =>
              email != null && !EmailValidator.validate(email)
                  ? 'Enter a valid email'
                  : null,
            ),
            const SizedBox(height: 40),
            TextFormField(
              controller: passwordController,
              cursorColor: Colors.white,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(label  : Text('Password *') ),
              obscureText: true,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (password) =>
              password != null && password.length < 6
                  ? 'Enter min. 6 characters'
                  : null,
            ),
            const SizedBox(height: 40),
            TextFormField(
              controller: confirmPasswordController,
              cursorColor: Colors.white,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(label  : Text('Confirm Password *') ),
              obscureText: true,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (password) =>
              password != null && passwordController.text.trim() != password ? 'Not the same' : null,
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
              icon : const Icon(Icons.arrow_forward , size: 32),
              label: const Text(
                ' Sign up',
                style : TextStyle(fontSize: 24),
              ),
              onPressed: signUp,
            ),
            const SizedBox(height: 20),
            InkWell(
                onTap:   widget.onClickedSignIn,
                child : const  Text(
                    'Sign In',
                    style : TextStyle(
                      decoration: TextDecoration.underline,
                      color : Colors.lightBlue
                    )
                )
            ),
          ],
        )
      )

  );
  Future signUp() async {

    final isValid = formKey.currentState!.validate();
    if(!isValid) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(child: CircularProgressIndicator()),
    );

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword (
        email : emailController.text.trim(),
        password : passwordController.text.trim(),
      ).then((cred) =>  {
          createUser(
            uid: cred.user?.uid,
            email: emailController.text.trim(),
            nickname: nicknameController.text.trim()
          )
      });

    } on FirebaseAuthException catch (e) {
      print(e);
      Utils.showSnackBar(e.message);
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  Future createUser({required String? uid , required String email , required String nickname}) async {
    final docUser =   FirebaseFirestore.instance.collection('users').doc(uid);
    // final json = {
    //   'last_name' : lastname,
    //   'first_name' : firstname,
    //   'age' :  age,
    //   'nickname' : nickname,
    //   'email' : email,
    // };

    final TrivialUser user  = TrivialUser (
      nickname: nickname,
      email: email,
      score : 0
    );

    final json = user.toJson();


    await docUser.set(json);
  }
}
