import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wordle/providers/settings.dart';

class MyAppBar extends StatefulWidget{
  const MyAppBar({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppBar();

}

class _MyAppBar extends State<MyAppBar>{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
            TextToggle(),
            Text("WORDLE", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
            WordSizeToggle(),
          ],),
          const Divider(),
        ],
      ),
    );
  }

}

class WordSizeToggle extends ConsumerWidget {
  const WordSizeToggle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gamesettings = ref.watch(settingsProvider);
    final gamesettingsnotifier = ref.read(settingsProvider.notifier);

    void _updateWordsize(){
      var newWordSize = 5;
      if (gamesettings.wordSize == 4) newWordSize = 5;
      if (gamesettings.wordSize == 5) newWordSize = 6;
      if (gamesettings.wordSize == 6) newWordSize = 4;
      gamesettingsnotifier.updateWordSize(newWordSize);
    }
    return Container(
      margin: const EdgeInsets.fromLTRB(30, 0, 0, 0),
      child: OutlinedButton(
        onPressed: _updateWordsize,
        child: Text(gamesettings.wordSize.toString())),
    );
  }
}

class TextToggle extends ConsumerWidget{
  const TextToggle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gamesettings = ref.watch(settingsProvider);
    final gamesettingsnotifier = ref.read(settingsProvider.notifier);
    var text = "LOW";

    void _updateAttempts(){
      var newAttempts = 6;
      if (gamesettings.attempts == 4) newAttempts = 5;
      if (gamesettings.attempts == 5) newAttempts = 6;
      if (gamesettings.attempts == 6) newAttempts = 4;
      gamesettingsnotifier.updateAttempts(newAttempts);
    }

    switch(gamesettings.attempts){
      case 4: text = "HIGH"; break;
      case 5: text = "MEDIUM"; break;
      case 6: default: "LOW"; break;
    }

    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 30, 0),
      child: OutlinedButton(
        onPressed: _updateAttempts,
        child: Text(text)),
    );
  }

}