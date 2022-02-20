import 'package:flutter/material.dart';
import 'package:wordle/widgets/cell.dart';

class MyRow extends StatelessWidget {
  final int wordSize;
  final String word;
  final String correctWord;
  final bool attempted;
  final bool isDark;
  final int attempts;
  const MyRow({Key? key, required this.wordSize, required this.word, required this.attempted, required this.correctWord, required this.isDark, required this.attempts})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final List<MyCell> boxes = List.empty(growable: true);
    for (int j = 0; j < wordSize; j++) {
      var letter = "";
      if (word.length > j){
        letter = word[j];
      }
      boxes.add(MyCell(word: word,pos: j,letter: letter, correctWord: correctWord, attempted: attempted, isDark: isDark, wordSize: wordSize, attempts: attempts));
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: boxes,
    );
  }
}
