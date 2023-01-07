import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/data/dataSources/repositories/user_repository.dart';
import 'package:test_flutter/page/leaderboard/bloc/leaderboard_cubit.dart';
import 'package:test_flutter/page/leaderboard/bloc/leaderboard_state.dart';

class LeaderboardPage extends StatefulWidget {
  const LeaderboardPage({Key? key}) : super(key: key);

  @override
  State<LeaderboardPage> createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends State<LeaderboardPage> {
  LeaderboardCubit? cubit;
  final searchBarController = TextEditingController();

  @override
  void dispose() {
    searchBarController.dispose();
    super.dispose();
  }

  ColorSwatch<int> rankingColor(int index) {
    if (index == 0) return Colors.green;
    if (index == 1) return Colors.lightGreenAccent;
    if (index == 2) return Colors.yellow;
    return Colors.red;
  }

  double rankingSize(int index) {
    if (index == 0) return 75;
    if (index == 1) return 70;
    if (index == 2) return 65;
    return 50;
  }

  TextStyle rankingTextStyle(int index) {
    double fontSize = 12;
    Color color = Colors.black;

    if (index == 0) {
      fontSize = 17;
      color = Colors.black;
    }

    if (index == 1) {
      fontSize = 16;
      color = Colors.black;
    }

    if (index == 2) {
      fontSize = 15;
      color = Colors.black;
    }

    return TextStyle(fontSize: fontSize, color: color);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RepositoryProvider(
      create: (context) => UserRepository.getInstance(),
      child: BlocProvider(
        create: (context) {
          cubit = LeaderboardCubit(
              repository: RepositoryProvider.of<UserRepository>(context));
          return cubit!..fetchUsers();
        },
        child: BlocConsumer<LeaderboardCubit, LeaderboardState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is Loaded) {
              return ListView(shrinkWrap: true, children: [
                Container(
                  height: 40,
                  width: 100,
                  alignment: Alignment.center,
                  child: Expanded(
                      child: Row(
                    children: [
                      IconButton(
                        onPressed: () => { searchBarController.clear()  , cubit!..fetchUsers()},
                        icon: const Icon(Icons.arrow_back),
                      ),
                      Expanded(child: _searchBar()),
                      IconButton(
                        onPressed: () => { search()},
                        icon: const Icon(Icons.search),
                      )
                    ],
                  )),
                ),
                const SizedBox(
                  height: 32,
                ),
                ...state.users.asMap().entries.map((user) {
                  return Card(
                    color: rankingColor(user.key),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                    child: SizedBox(
                        height: rankingSize(user.key),
                        width: double.infinity,
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          alignment: Alignment.center,
                          child: Row(children: [
                            Text((user.key + 1).toString(),
                                textAlign: TextAlign.start,
                                style: rankingTextStyle(user.key)),
                            Padding(
                              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                              //apply padding to LTRB, L:Left, T:Top, R:Right, B:Bottom
                              child: Text(user.value?.nickname ?? "Inconnu",
                                  textAlign: TextAlign.start,
                                  style: rankingTextStyle(user.key)),
                            ),
                            Expanded(
                                child: Text(
                                    user.value?.score.toString() ?? "Inconnu",
                                    textAlign: TextAlign.end,
                                    style: rankingTextStyle(user.key))),
                          ]),
                        )),
                  );
                }).toList(),
              ]);
            }
            if (state is Error) {}
            return CircularProgressIndicator();
          },
        ),
      ),
    ));
  }

  Widget _searchBar() {
    return TextField(
      controller: searchBarController,
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        hintText: 'Rechercher ...',
        hintStyle: TextStyle(
          color: Colors.red,
          fontSize: 18,
          fontStyle: FontStyle.italic,
        ),
        //border: InputBorder.none,
      ),
      style: const TextStyle(
        color: Colors.blueGrey,
      ),
    );
  }


  Future search() async {
      await cubit?.search(searchBarController.value.text);
  }
}
