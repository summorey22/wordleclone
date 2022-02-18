import 'package:flutter/material.dart';
import 'package:wordle/widgets/cell.dart';

class MyRow extends StatelessWidget {
  final int wordSize;
  final String word;
  final String correctWord;
  final bool attempted;
  const MyRow({Key? key, required this.wordSize, required this.word, required this.attempted, required this.correctWord})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final List<MyCell> boxes = List.empty(growable: true);
    for (int j = 0; j < wordSize; j++) {
      var letter = "";
      if (word.length > j){
        letter = word[j];
      }
      boxes.add(MyCell(pos: j,letter: letter, correctWord: correctWord, attempted: attempted));
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: boxes,
    );
  }
}
