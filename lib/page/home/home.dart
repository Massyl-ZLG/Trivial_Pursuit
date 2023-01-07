import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_flutter/page/game/game_page.dart';
import 'package:test_flutter/page/leaderboard/leaderboard_page.dart';

import '../profil/profil_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final user = FirebaseAuth.instance.currentUser;
  var _showAppBar = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
              'Trivial Pursuit',
              style: TextStyle(
                  color: Colors.white
              )
          ),
          backgroundColor: Color(0xFFe34d40),
      ),
      body: widget.child,
      bottomNavigationBar: Visibility(
        visible: _showAppBar,
        child: BottomNavigationBar(
          currentIndex: _calculateSelectedIndex(context),
          onTap: onTap,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.grade,
                color: Colors.white,
              ),
              label: 'Ranking',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.sports_esports,
                color: Colors.white,
              ),
              label: 'Game',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              label: 'Profil',
            ),
          ],
          backgroundColor: Color(0xFFe34d40),
          selectedItemColor: Colors.white,
        ),
      ),
    );
  }

  int _calculateSelectedIndex(BuildContext context) {
    final GoRouter route = GoRouter.of(context);
    final String location = route.location;
    _showAppBar = user != null;
    if (location.startsWith('/leaderboard')) {
      return 0;
    }
    if (location.startsWith('/game')) {
      return 1;
    }
    if (location.startsWith('/profil')) {
      return 2;
    }
    return 0;
  }

  void onTap(int value) {
    switch (value) {
      case 0:
        return context.go('/leaderboard');
      case 1:
        return context.go('/game');
      case 2:
        return context.go('/profil');
      default:
        return context.go('/');
    }
  }
}
