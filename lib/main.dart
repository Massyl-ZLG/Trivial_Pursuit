import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_flutter/page/auth_page.dart';
import 'package:test_flutter/page/game/game_page.dart';
import 'package:test_flutter/page/verifiy_email_page.dart';
import 'package:test_flutter/utils.dart';

import 'home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  static const String title = 'Setup Firebase';

  @override
  Widget build(BuildContext context) =>  MaterialApp(
    scaffoldMessengerKey: Utils.messengerKey,
      debugShowCheckedModeBanner: false,
      title: title,
      navigatorKey: navigatorKey,
      home:  GamePage(),
    );

}

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) => Scaffold(
        body : StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context , snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator());
            }else if(snapshot.hasError){
              return const Center(child: Text('Something went wrong  '));
            }else if(snapshot.hasData){
              return Home(); // VerifyEmailPage();
              return const Home();
            }else{
              return  AuthPage();
            }

          },
        )
    );

}


