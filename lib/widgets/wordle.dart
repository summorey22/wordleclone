import 'package:flutter/material.dart';
import 'package:wordle/widgets/appbar.dart';
import 'package:wordle/widgets/grid.dart';
import 'package:wordle/widgets/keyboard.dart';

class MyWordle extends StatefulWidget{
  const MyWordle({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyWordle();

}

class _MyWordle extends State<MyWordle>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            MyAppBar(),
            MyGrid(),
            MyKeyboard(),
          ]),
      ),
    );
  }

}