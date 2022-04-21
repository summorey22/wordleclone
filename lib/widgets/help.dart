import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  final bool isDark;
  const Help({Key? key, required this.isDark}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: getBgColor(),
      body: Container(
          padding: EdgeInsets.only(
              top: 35, left: getPadding(context), right: getPadding(context)),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.alarm,
                      color: Colors.transparent,
                    ),
                    splashRadius: 1.0,
                  ),
                  const Spacer(),
                  Text(
                    "HOW TO PLAY",
                    style: TextStyle(
                        color: getColor(),
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.close,
                      color: getColor(),
                    ),
                    splashRadius: 18.0,
                  ),
                ],
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(top: 15.0, bottom: 10.0),
                child: RichText(
                    text: TextSpan(
                        style: TextStyle(
                          fontSize: 14.0,
                          color: getColor(),
                        ),
                        children: const [
                      TextSpan(text: 'Guess the '),
                      TextSpan(
                          text: 'WORDLE',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: ' in six tries.\n\n'),
                      TextSpan(
                          text:
                              'Each guess must be a valid five-letter word. Hit the enter button to submit.\n\n'),
                      TextSpan(
                          text:
                              'After each guess, the color of the tiles will change to show how close your guess was to the word.')
                    ])),
              ),
              const Divider(
                color: Colors.grey,
              ),
              Container(
                  margin: const EdgeInsets.only(top: 10.0, bottom: 20.0),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Examples",
                    style: TextStyle(
                        color: getColor(), fontWeight: FontWeight.bold),
                  )),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xff6aaa64),
                    ),
                    height: 45,
                    width: 45,
                    alignment: Alignment.center,
                    child: const Text(
                      "W",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 4.0),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: getBorder(), width: 2.0)),
                    height: 45.0,
                    width: 45.0,
                    alignment: Alignment.center,
                    child: Text(
                      "E",
                      style: TextStyle(
                          color: getColor(),
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 4.0),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: getBorder(), width: 2.0)),
                    height: 45.0,
                    width: 45.0,
                    alignment: Alignment.center,
                    child: Text(
                      "A",
                      style: TextStyle(
                          color: getColor(),
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 4.0),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: getBorder(), width: 2.0)),
                    height: 45.0,
                    width: 45.0,
                    alignment: Alignment.center,
                    child: Text(
                      "R",
                      style: TextStyle(
                          color: getColor(),
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 4.0),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: getBorder(), width: 2.0)),
                    height: 45.0,
                    width: 45.0,
                    alignment: Alignment.center,
                    child: Text(
                      "Y",
                      style: TextStyle(
                          color: getColor(),
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(top: 15, bottom: 20),
                child: Text(
                  "The letter W is in the word and in the correct spot.",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: getColor(),
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: getBorder(), width: 2)),
                    height: 45.0,
                    width: 45.0,
                    alignment: Alignment.center,
                    child: Text(
                      "P",
                      style: TextStyle(
                          color: getColor(),
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 4.0),
                    decoration: const BoxDecoration(
                      color: Color(0xffc9b458),
                    ),
                    height: 45.0,
                    width: 45.0,
                    alignment: Alignment.center,
                    child: const Text(
                      "I",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 4.0),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: getBorder(), width: 2.0)),
                    height: 45.0,
                    width: 45.0,
                    alignment: Alignment.center,
                    child: Text(
                      "L",
                      style: TextStyle(
                          color: getColor(),
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 4.0),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: getBorder(), width: 2.0)),
                    height: 45.0,
                    width: 45.0,
                    alignment: Alignment.center,
                    child: Text(
                      "I",
                      style: TextStyle(
                          color: getColor(),
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 4),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: getBorder(), width: 2)),
                    height: 45,
                    width: 45,
                    alignment: Alignment.center,
                    child: Text(
                      "S",
                      style: TextStyle(
                          color: getColor(),
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(top: 15, bottom: 20),
                child: Text(
                  "The letter I is in the word but in the wrong spot.",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: getColor(),
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: getBorder(), width: 2)),
                    height: 45,
                    width: 45,
                    alignment: Alignment.center,
                    child: Text(
                      "V",
                      style: TextStyle(
                          color: getColor(),
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 4),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: getBorder(), width: 2)),
                    height: 45,
                    width: 45,
                    alignment: Alignment.center,
                    child: Text(
                      "A",
                      style: TextStyle(
                          color: getColor(),
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 4),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: getBorder(), width: 2)),
                    height: 45,
                    width: 45,
                    alignment: Alignment.center,
                    child: Text(
                      "G",
                      style: TextStyle(
                          color: getColor(),
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 4),
                    decoration: const BoxDecoration(
                      color: Color(0xff3a3a3c),
                    ),
                    height: 45,
                    width: 45,
                    alignment: Alignment.center,
                    child: const Text(
                      "U",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 4),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: getBorder(), width: 2)),
                    height: 45,
                    width: 45,
                    alignment: Alignment.center,
                    child: Text(
                      "E",
                      style: TextStyle(
                          color: getColor(),
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(top: 15, bottom: 20),
                child: const Text(
                  "The letter U is not in the word in any spot.",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                  ),
                ),
              ),
              const Divider(
                color: Colors.grey,
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(top: 5),
                child: Text(
                  "Play with Unlimited words!",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                    color: getColor(),
                  ),
                ),
              ),
            ],
          )),
    );
  }

  getPadding(BuildContext context) {
    if (MediaQuery.of(context).size.width > 1400) {
      return 550.toDouble();
    }
    return 20.toDouble();
  }

  getColor() {
    if (isDark) {
      return Colors.white;
    }
    return Colors.black;
  }

  getBgColor() {
    if (!isDark) {
      return Colors.white;
    }
    return const Color(0xff121213);
  }

  getBorder() {
    if (isDark) {
      return const Color(0xff565758);
    }
    return Colors.black;
  }
}