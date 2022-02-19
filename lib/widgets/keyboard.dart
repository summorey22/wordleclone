import 'package:flutter/material.dart';
import 'package:wordle/widgets/key.dart';

class MyKeyboard extends StatefulWidget{
  final bool isDark;
  const MyKeyboard({Key? key, required this.isDark}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyKeyboard();

}

class _MyKeyboard extends State<MyKeyboard>{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
             for (var i in "qwertyuiop".split("") ) MyKey(letter: i,)
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (var i in "asdfghjkl".split("") ) MyKey(letter: i,)
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (var i in "_zxcvbnm>".split("") ) MyKey(letter: i,)
          ],),
        ],
      ),
    );
  }

}