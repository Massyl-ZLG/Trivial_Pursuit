import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:test_flutter/page/auth/auth_page.dart';
import 'package:test_flutter/page/game/game_page.dart';
import 'package:test_flutter/page/leaderboard/leaderboard_page.dart';
import 'package:test_flutter/page/profil/profil_page.dart';
import 'package:test_flutter/page/utils/utils.dart';

import 'page/home/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String title = 'Setup Firebase';

  static var _rootNavigatorKey;
  static var _shellNavigatorKey;

  final _router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return Home(child: child);
        },
        routes: [
          GoRoute(
              path: '/',
              name: 'login',
              builder: (context, state) {
                return AuthPage();
              }),
          GoRoute(
              path: '/leaderboard',
              name: 'leaderboard',
              builder: (context, state) {
                return LeaderboardPage();
              }),
          GoRoute(
              path: '/game',
              name: 'game',
              builder: (context, state) {
                return GamePage();
              }),
          GoRoute(
            path: '/profil',
            name: 'profil',
            builder: (context, state) {
              return ProfilPage();
            },
          ),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        title: "Exemple",
        theme: ThemeData(),
        darkTheme: ThemeData(),
        debugShowCheckedModeBanner: false,
        routeInformationProvider: _router.routeInformationProvider,
        routeInformationParser: _router.routeInformationParser,
        routerDelegate: _router.routerDelegate,
        backButtonDispatcher: _router.backButtonDispatcher,
      );
}
/*
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
*/
