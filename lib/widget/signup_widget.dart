import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
  final pseudoController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController =  TextEditingController();

  @override
  void dispose(){
    emailController.dispose();
    pseudoController.dispose();
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
              controller: pseudoController,
              cursorColor: const Color(0xFFe34d40),
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration( label  : Text('pseudo *') ),
              obscureText: false,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (pseudo) =>
              pseudo == null
                  ? 'Enter a valid pseudo'
                  : null,
            ),
            const SizedBox(height: 40),
            TextFormField(
              controller: emailController,
              cursorColor: const Color(0xFFe34d40),
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
              cursorColor: const Color(0xFFe34d40),
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
              cursorColor: const Color(0xFFe34d40),
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
                primary: const Color(0xFFe34d40),
                minimumSize: const Size.fromHeight(50),
              ),
              icon : const Icon(Icons.login , size: 32),
              label: const Text(
                ' Sign up',
                style : TextStyle(fontSize: 24),
              ),
              onPressed: () => signUp(context),
            ),
            const SizedBox(height: 20),
            InkWell(
                onTap:   widget.onClickedSignIn,
                child : const  Text(
                    'Sign In',
                    style : TextStyle(
                      decoration: TextDecoration.underline,
                      color : Color(0xFFe34d40)
                    )
                )
            ),
          ],
        )
      )

  );
  Future signUp(context) async {

    final isValid = formKey.currentState!.validate();
    if(!isValid) return;

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword (
        email : emailController.text.trim(),
        password : passwordController.text.trim(),
      ).then((cred) =>  {
          createUser(
            uid: cred.user?.uid,
            pseudo: pseudoController.text.trim()
          ),
          context.goNamed('game')
      });
    } on FirebaseAuthException catch (e) {
      print(e);
      Utils.showSnackBar(e.message);
    }
  }

  Future createUser({required String? uid  , required String pseudo}) async {
    final docUser =   FirebaseFirestore.instance.collection('users').doc(uid);

    final TrivialUser user  = TrivialUser (
      pseudo: pseudo,
      score : 0,
      played_at: ""
    );
    final json = user.toJson();

    await docUser.set(json).then((value) => context.goNamed('game'));
  }
}
