import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../model/trivial_user.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({Key? key}) : super(key: key);

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();


}

class _ProfilScreenState extends State<ProfilScreen> {
  @override
  Widget build(BuildContext context)  =>  Column(
      children: <Widget>[
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: <Widget>[
            Image(
              width: double.infinity,
                height: MediaQuery.of(context).size.height /3,
                fit: BoxFit.cover,
                image: const NetworkImage(
                    'https://img1.psthc.fr/62/00_4be196a54cf0a.PNG')),
            const Positioned(
                bottom: -70.0,
                child: CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(
                      'https://avatars.githubusercontent.com/u/81617366?v=4'),))
          ],
        ),
        const SizedBox(height: 60,),
        const ListTile(
          title: Center(child: Text('Massyl Zelleg')),
          subtitle: Center(child: Text('Devops Ingineer')),
        ),
        TextButton(
            onPressed: (){},
            child: Text('test text button')),
        const Center(
          child: ListTile(
            title: Text('About me'),
            subtitle: Text('blablablabla'),
          ),
        ),

        const SizedBox(height: 40),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(50),
          ),
          icon: const Icon(Icons.arrow_back  , size: 32),
          label : const Text(
            'Sign Out',
            style: TextStyle(fontSize : 24),
          ),
          onPressed: () => FirebaseAuth.instance.signOut(),

        )
      ],
    );


  Stream<List<TrivialUser>> readUsers() => FirebaseFirestore.instance
      .collection('users')
      .snapshots()
      .map((snapshot) =>
      snapshot.docs.map((doc) => TrivialUser.fromJson(doc.data())).toList());

}

