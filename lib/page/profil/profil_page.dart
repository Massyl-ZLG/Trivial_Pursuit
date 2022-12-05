import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  final nicknameController = TextEditingController();

  @override
  void dispose(){
    nicknameController.dispose();
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
                      ElevatedButton.icon(
                          onPressed: () => cubit?.edit(),
                          icon: const Icon(Icons.edit, size: 24),
                          label: const Text(
                          'Editer',
                          style : TextStyle(fontSize: 18),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: StadiumBorder()
                          ),
                      ),
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
          //_currentResponse = [];
        },
        child: const Icon(
            Icons.login_outlined,
            color: Colors.white,
        ),
        backgroundColor: Colors.black,
      ));



  Widget _edit(){
    return Column(  mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 40),
          TextFormField(
            controller: nicknameController,
            cursorColor: Colors.white,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration( label  : Text('Nickname ') ),
            obscureText: false,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (nickname) =>
            nickname == null
                ? 'Enter a valid nickname'
                : null,
          ),
          const SizedBox(height: 40),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
            ),
            icon : const Icon(Icons.lock_open , size: 32),
            label: const Text(
              'Sign In',
              style : TextStyle(fontSize: 24),
            ),
            onPressed: update,
          ),
          TextButton(
              onPressed: () => cubit?.show(),
              child: Text('Retour au profil')),
        ]
    );
  }


  Future update() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );


    try {
      // await FirebaseAuth.instance.signInWithEmailAndPassword(
      //   email : emailController.text.trim(),
      //   password : passwordController.text.trim(),
      // );
    } on FirebaseAuthException catch (e) {
      print(e);
      Utils.showSnackBar(e.message);
    }
  }
}
