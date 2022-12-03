import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/data/dataSources/repositories/user_repository.dart';
import 'package:test_flutter/page/profil/bloc/profil_state.dart';
import 'bloc/profil_cubit.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  ProfilCubit? cubit;
  final currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) => Scaffold(
      body: RepositoryProvider(
          create: (context) => UserRepository.getInstance(),
          child: BlocProvider(
            create: (context) {
              cubit = ProfilCubit(
                  repository: RepositoryProvider.of<UserRepository>(context));
              return cubit!..fetchUser(currentUser?.uid);
            },
            child: BlocConsumer<ProfilCubit, ProfilState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is Loaded) {
                  return Column(
                    children: <Widget>[
                      Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.center,
                        children: <Widget>[
                          Image(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height / 3,
                              fit: BoxFit.cover,
                              image: const NetworkImage(
                                  'https://img1.psthc.fr/62/00_4be196a54cf0a.PNG')),
                          const Positioned(
                              bottom: -70.0,
                              child: CircleAvatar(
                                radius: 80,
                                backgroundColor: Colors.white,
                                backgroundImage: NetworkImage(
                                    'https://avatars.githubusercontent.com/u/81617366?v=4'),
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      ListTile(
                        title: Center(
                            child: Text(state.user?.nickname ?? "Inconnu")),
                        subtitle: Center(
                            child: Text("Score : " +
                                (state.user?.score.toString() ?? "Inconnu"))),
                      ),
                      TextButton(
                          onPressed: () => cubit?.edit(),
                          child: Text('Editer')),
                      Center(
                        child: ListTile(
                          title: Text('A propos'),
                          subtitle: Text(
                              "Email : " + (state.user?.email ?? "Inconnu")),
                        ),
                      ),
                    ],
                  );
                }
                if (state is Edit) {
                  return Text("Loool");
                }
                if (state is Error) {}
                return const CircularProgressIndicator();
              },
            ),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FirebaseAuth.instance.signOut();
          //_currentResponse = [];
        },
        child: const Icon(Icons.logout),
      ));
}
