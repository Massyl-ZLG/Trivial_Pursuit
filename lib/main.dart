import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:test_flutter/page/auth/auth_page.dart';
import 'package:test_flutter/page/leaderboard/leaderboard_page.dart';
import 'package:test_flutter/page/utils/utils.dart';

import 'page/home/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  static const String title = 'Setup Firebase';


  final _router = GoRouter(routes: [
    GoRoute(
        path : '/',
        builder: (context , state){
          return AuthPage();
        }
    ),
    GoRoute(
        path: '/leaderboard',
        name : 'leaderboard',
        builder : (context , state) {
          return LeaderboardPage();
        }
    )
  ]);

  @override
  Widget build(BuildContext context) => MaterialApp.router(
    title : "Exemple",
    theme: ThemeData(),
    darkTheme: ThemeData(),
    debugShowCheckedModeBanner: false,
    routeInformationProvider: _router.routeInformationProvider,
    routeInformationParser: _router.routeInformationParser,
    routerDelegate: _router.routerDelegate,
    backButtonDispatcher: _router.backButtonDispatcher,
  );

  /**Widget build(BuildContext context) =>  MaterialApp(
    scaffoldMessengerKey: Utils.messengerKey,
      debugShowCheckedModeBanner: false,
      title: title,
      navigatorKey: navigatorKey,
      home:  MyHomePage(),
    );**/

}

class MyHomePage extends StatelessWidget {

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
            }else{
              return  AuthPage();
            }
          },
        )
    );

}


