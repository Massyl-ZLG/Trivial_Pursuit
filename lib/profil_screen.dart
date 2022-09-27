import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({Key? key}) : super(key: key);

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Padding(
          padding: EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment : MainAxisAlignment.center,
            children: [
              TextField(   decoration: InputDecoration( label  : Text('Sign Out') )),
              SizedBox(height: 40),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(50),
                ),
                  icon: Icon(Icons.arrow_back  , size: 32),
                  label : Text(
                      'Sign Out',
                    style: TextStyle(fontSize : 24),
                  ),
                  onPressed: () => FirebaseAuth.instance.signOut(),

              )
            ],
          ),
        )
    );
  }
}
