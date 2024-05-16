import 'package:flutter/material.dart';
import 'package:homewor_35_lesson/pages/game_page.dart';

void main(List<String> args) {
  runApp(Project());
}

class Project extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Color.fromARGB(255, 255, 0, 0),
      debugShowCheckedModeBanner: false,
      home: GamePaje(),
    );
  }
}
