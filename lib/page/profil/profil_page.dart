import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test_flutter/data/dataSources/repositories/user_repository.dart';
import 'package:test_flutter/page/profil/bloc/profil_state.dart';

import '../utils/utils.dart';
import 'bloc/profil_cubit.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  ProfilCubit? cubit;
  final currentUser = FirebaseAuth.instance.currentUser;

  final pseudoController = TextEditingController();

  @override
  void dispose() {
    pseudoController.dispose();
    super.dispose();
  }

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
                                  'https://r4.wallpaperflare.com/wallpaper/758/252/42/firewatch-video-games-mountains-nature-wallpaper-d8c6cc1acf2cf7c96e70797232d9cb10.jpg')),
                          const Positioned(
                              bottom: -70.0,
                              child: CircleAvatar(
                                radius: 80,
                                backgroundColor: Colors.white,
                                backgroundImage: NetworkImage(
                                    'https://i0.wp.com/www.kimonosport.com/wp-content/uploads/2018/08/historia-de-jean-claude-van-damme-1024x575.jpg?resize=1020%2C573&ssl=1'),
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      ListTile(
                        title: Center(
                            child: Text(
                                state.user?.pseudo ?? "Inconnu",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                              ),
                            ),),
                        subtitle: Center(
                            child: Text(
                                "Score : ${state.user?.score.toString() ?? "Inconnu"}",
                              style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              )
                            )),
                      ),
                      ElevatedButton.icon(
                        onPressed: () => cubit?.edit(),
                        icon: const Icon(Icons.edit, size: 24),
                        label: const Text(
                          'Editer',
                          style: TextStyle(fontSize: 18),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: StadiumBorder()),
                      ),
                      Center(
                        child: ListTile(
                          title: const Text(
                              'A propos',
                              style: TextStyle(
                                  fontStyle: FontStyle.normal
                              ),
                          ),
                          subtitle: Text(
                              "Email : " + (state.user?.email ?? "Inconnu")),
                        ),
                      ),
                    ],
                  );
                }
                if (state is Edit) {
                  return _edit();
                }
                if (state is Error) {}
                return const CircularProgressIndicator();
              },
            ),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FirebaseAuth.instance.signOut();
          context.goNamed("login");
          //_currentResponse = [];
        },
        backgroundColor: Colors.black,
        child: const Icon(
          Icons.login_outlined,
          color: Colors.white,
        ),
      ));

  Widget _edit() {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const SizedBox(height: 40),
      Padding(
          padding: EdgeInsets.only(left: 80, bottom: 20, right: 80, top: 10),
          child: TextFormField(
            controller: pseudoController,
            cursorColor: Colors.white,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
                label: Text(
              'pseudo',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal
              ),
            ),
            ),
            obscureText: false,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (pseudo) =>
                pseudo == null ? 'Enter a valid pseudo' : null,
          )),
      const SizedBox(height: 40),
      Padding(
        padding: EdgeInsets.only(left: 80, bottom: 20, right: 80, top: 10),
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            primary: const Color(0xFFe34d40),
            minimumSize: const Size.fromHeight(50),
          ),
          icon: const Icon(Icons.update, size: 32),
          label: const Text(
            'Valider',
            style: TextStyle(fontSize: 24),
          ),
          onPressed: update,
        ),
      ),
      TextButton(
          onPressed: () => cubit?.show(),
          child: const Text('Retour au profil',
              style: TextStyle(color: Colors.black))),
    ]);
  }

  Future update() async {
    cubit?.updatePseudo( currentUser?.uid , pseudoController.text);
  }
}
