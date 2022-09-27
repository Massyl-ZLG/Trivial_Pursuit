import 'package:flutter/material.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({Key? key}) : super(key: key);

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: <Widget>[
            Image(
              width: double.infinity,
                height: MediaQuery.of(context).size.height /3,
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://img1.psthc.fr/62/00_4be196a54cf0a.PNG')),
            Positioned(
                bottom: -70.0,
                child: CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(
                      'https://avatars.githubusercontent.com/u/81617366?v=4'),))
          ],
        ),
        SizedBox(height: 60,),
        ListTile(
          title: Center(child: Text('Massyl Zelleg')),
          subtitle: Center(child: Text('Devops Ingineer')),
        ),
        TextButton(
            onPressed: (){},
            child: Text('test text button')),
        Center(
          child: ListTile(
            title: Text('About me'),
            subtitle: Text('blablablabla'),
          ),
        )
      ],
    );
  }
}
