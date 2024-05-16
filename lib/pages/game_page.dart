import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GamePaje extends StatefulWidget {
  @override
  State<GamePaje> createState() {
    return _GamePageState();
  }
}

class _GamePageState extends State<GamePaje> {
  List<String> boxes = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
  int counter = 0;
  String winner = '';
  void onPressed(int index) {
    if (boxes[index].isEmpty && winner.isEmpty) {
      boxes[index] = 'x';
      counter++;
      winner = checkWin();

      if (counter < 9) {
        int randomNumber = Random().nextInt(9);

        while (boxes[randomNumber].isNotEmpty || counter > 9) {
          randomNumber = Random().nextInt(9);
        }
        boxes[randomNumber] = "o";
        counter++;
        winner = checkWin();
      }

      setState(() {});
      if (winner.isNotEmpty) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (ctg) {
            return AlertDialog(
              backgroundColor: Color.fromARGB(255, 183, 183, 183),
              title: Row(
                children: [
                  Text(
                    '$winner',
                    style: const TextStyle(fontSize: 34),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '''

Won this game.
    Congratulations ✨🎖''',
                    style: TextStyle(fontSize: 10),
                  )
                ],
              ),
              actions: [
                OutlinedButton.icon(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  label: const Text(
                    'oK',
                    style: TextStyle(color: Colors.black),
                  ),
                  icon: const Icon(
                    Icons.thumb_up_alt,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ],
            );
          },
        );
      } else if (counter == 9 && winner.isEmpty) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (ctg) {
            return AlertDialog(
              backgroundColor: Color.fromARGB(255, 183, 183, 183),
              title: const Row(
                children: [
                  Text(
                    'Durrang',
                    style: const TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '''

Nobody won this game.
    Try again! 🔄''',
                    style: TextStyle(fontSize: 10),
                  )
                ],
              ),
              actions: [
                OutlinedButton.icon(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  label: const Text(
                    'oK',
                    style: TextStyle(color: Colors.black),
                  ),
                  icon: const Icon(
                    Icons.thumb_up_alt,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ],
            );
          },
        );
      }
    }
  }

  String checkWin() {
    if (boxes[0] == "x" && boxes[1] == "x" && boxes[2] == "x") {
      return "x";
    } else if (boxes[3] == "x" && boxes[4] == "x" && boxes[5] == "x") {
      return "x";
    } else if (boxes[6] == "x" && boxes[7] == "x" && boxes[8] == "x") {
      return "x";
    } else if (boxes[0] == "x" && boxes[3] == "x" && boxes[6] == "x") {
      return "x";
    } else if (boxes[1] == "x" && boxes[4] == "x" && boxes[7] == "x") {
      return "x";
    } else if (boxes[2] == "x" && boxes[5] == "x" && boxes[8] == "x") {
      return "x";
    } else if (boxes[0] == "x" && boxes[4] == "x" && boxes[8] == "x") {
      return "x";
    } else if (boxes[2] == "x" && boxes[4] == "x" && boxes[6] == "x") {
      return "x";
    }

    if (boxes[0] == "o" && boxes[1] == "o" && boxes[2] == "o") {
      return "o";
    } else if (boxes[3] == "o" && boxes[4] == "o" && boxes[5] == "o") {
      return "o";
    } else if (boxes[6] == "o" && boxes[7] == "o" && boxes[8] == "o") {
      return "o";
    } else if (boxes[0] == "o" && boxes[3] == "o" && boxes[6] == "o") {
      return "o";
    } else if (boxes[1] == "o" && boxes[4] == "o" && boxes[7] == "o") {
      return "o";
    } else if (boxes[2] == "o" && boxes[5] == "o" && boxes[8] == "o") {
      return "o";
    } else if (boxes[0] == "o" && boxes[4] == "o" && boxes[8] == "o") {
      return "o";
    } else if (boxes[2] == "o" && boxes[4] == "o" && boxes[6] == "o") {
      return "o";
    }

    return "";
  }

  void restart() {
    boxes = [
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
    ];
    counter = 0;
    winner = '';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 166, 205, 203),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 27, 137, 30),
        title: const Text('Tic Tac Toe'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    onPressed(0);
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Text(
                      boxes[0],
                      style: const TextStyle(
                          color: Color.fromARGB(255, 1, 84, 21), fontSize: 50),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    onPressed(1);
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Text(
                      boxes[1],
                      style: const TextStyle(
                          color: Color.fromARGB(255, 1, 84, 21), fontSize: 50),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    onPressed(2);
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Text(
                      boxes[2],
                      style: const TextStyle(
                          color: Color.fromARGB(255, 1, 84, 21), fontSize: 50),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    onPressed(3);
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Text(
                      boxes[3],
                      style: const TextStyle(
                          color: Color.fromARGB(255, 1, 84, 21), fontSize: 50),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    onPressed(4);
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Text(
                      boxes[4],
                      style: const TextStyle(
                          color: Color.fromARGB(255, 1, 84, 21), fontSize: 50),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    onPressed(5);
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Text(
                      boxes[5],
                      style: const TextStyle(
                          color: Color.fromARGB(255, 1, 84, 21), fontSize: 50),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    onPressed(6);
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Text(
                      boxes[6],
                      style: const TextStyle(
                          color: Color.fromARGB(255, 1, 84, 21), fontSize: 50),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    onPressed(7);
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Text(
                      boxes[7],
                      style: const TextStyle(
                          color: Color.fromARGB(255, 1, 84, 21), fontSize: 50),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    onPressed(8);
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Text(
                      boxes[8],
                      style: const TextStyle(
                          color: Color.fromARGB(255, 1, 84, 21), fontSize: 50),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    restart();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: const Text('New Game'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    restart();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: const Text('Reset Game'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
