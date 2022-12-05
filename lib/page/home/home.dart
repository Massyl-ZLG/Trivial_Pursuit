import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/page/game/game_page.dart';
import 'package:test_flutter/page/leaderboard/leaderboard_page.dart';

import '../profil/profil_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final user = FirebaseAuth.instance.currentUser;

   int _selectedIndex=0;
   final List<StatefulWidget> _pages = [LeaderboardPage(),GamePage(),ProfilPage()];
   void _onItemTapped(int index) {
     setState(() {
       _selectedIndex = index;
     });
   }
   @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text(
            'Trivial Pursuit',
          style: TextStyle(
            color: Colors.white
          )
        ),
        backgroundColor: Color(0xFFe34d40),
      ),
      body: IndexedStack(
          index : _selectedIndex,
          children: _pages,
        ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[

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
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
