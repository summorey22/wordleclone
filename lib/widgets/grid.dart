import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wordle/providers/settings.dart';
import 'package:wordle/providers/state.dart';
import 'package:wordle/widgets/row.dart';



class MyGrid extends ConsumerWidget {
  const MyGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gamesettings = ref.watch(settingsProvider);
    final attempts = gamesettings.attempts;
    final gameState = ref.watch(gameStateProvider);

    final wordSize = gamesettings.wordSize;
    final List<MyRow> rows = List.empty(growable: true);
    for (int i = 0; i < attempts; i++){
      var word = "";
      if(gameState.attempts.length > i){
        word = gameState.attempts[i];
      }
      var attempted = false;
      if (gameState.attempted > i){
        attempted = true;
      }
      rows.add(MyRow(wordSize: wordSize, word: word, attempted: attempted,correctWord: gameState.correctWord,));
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: rows,
    );
  }
}

