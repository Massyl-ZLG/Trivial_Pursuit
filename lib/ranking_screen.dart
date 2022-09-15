import 'package:flutter/material.dart';

class RankingScreen extends StatefulWidget {
  const RankingScreen({Key? key}) : super(key: key);

  @override
  State<RankingScreen> createState() => _RankingScreenState();
}

class _RankingScreenState extends State<RankingScreen> {
  List ranks = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children:
          List.generate(ranks.length, (index) {
            return ListTile(
              title
                  : Text(ranks[index].toString()),
              leading
                  : const Icon(Icons.people), );
          }),
        ),
    );
  }
}
