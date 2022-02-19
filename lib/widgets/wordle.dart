import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wordle/widgets/grid.dart';
import 'package:wordle/widgets/keyboard.dart';

import '../providers/settings.dart';

class MyWordle extends StatefulWidget{
  const MyWordle({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyWordle();

}

class _MyWordle extends State<MyWordle>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,
      toolbarHeight: 50,
      iconTheme: const IconThemeData(color: Colors.black, ),
      title: const Text("WORDLE", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black),),
      backgroundColor: Colors.transparent,
      elevation: 0,
      ),
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 50, left: 20),
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.settings_applications_outlined, color: Colors.black,),
                    const VerticalDivider(
                      color: Colors.black,
                    ),
                    const Text("Settings", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                    const Spacer(),
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: IconButton(
                        splashRadius: 25,
                        onPressed: (){
                          Navigator.pop(context);
                        } ,icon: const Icon(Icons.close),),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 40, left: 20, right: 25),
              child: const Divider()),
            Container(
              margin: const EdgeInsets.only(left: 20, top: 5),
              child: Row(
                children: [
                const Text("Difficulty of game: "),
                const Spacer(),
                Container(
                  margin: const EdgeInsets.only(right: 25),
                  child: const TextToggle()),
              ]),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, top: 10),
              child: Row(children: [
                const Text("Wordsize for guessing: "),
                const Spacer(),
                Container(
                  margin: const EdgeInsets.only(right: 25),
                  child: const WordSizeToggle()),
              ]),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5, left: 20, right: 25),
              child: const Divider()),
            Container(
              
            ),
          ],
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(top: getHeight()),
              child: Container(
                alignment: Alignment.center,
                child: const MyGrid())),
            const MyKeyboard(),
          ]),
      ),
    );
  }

  getHeight() {
    if(MediaQuery.of(context).size.width<600){
      return 15;
    }
    return 40;
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

    return SizedBox(
      width: 90,
      child: OutlinedButton(
        onPressed: _updateAttempts,
        child: Text(text)),
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
    return SizedBox(
      width: 90,
      child: OutlinedButton(
        onPressed: _updateWordsize,
        child: Text(gamesettings.wordSize.toString())),
    );
  }
}