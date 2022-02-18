import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wordle/providers/state.dart';

class MyKey extends ConsumerWidget{
  const MyKey({Key? key, required this.letter}) : super(key: key);
  final String letter;

   @override
  Widget build(BuildContext context,WidgetRef ref) {
    final StatelessWidget keyCap;
    double width = 60;
    if (letter == "_"){
      keyCap = const Text("ENTER", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.white));
    }
    else if (letter == ">"){
      keyCap = const Icon(Icons.backspace_outlined, size: 17, color: Colors.white,);
    }
    else{
      width = 40;
      keyCap = Text(letter.toUpperCase(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),);
    }

    final gamesetting = ref.watch(gameStateProvider);

    return InkWell(
      splashFactory: NoSplash.splashFactory,
      splashColor: Colors.transparent,
      onTap: () {
        ref.read(gameStateProvider.notifier).updateCurrentAttempt(letter);
      },
      child: Container(
        width: width,
        height: 50,
        alignment: Alignment.center,
        margin: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: getColor(gamesetting, letter.toLowerCase())),
        child: keyCap,
      ),
    );
  }

  getColor(GameState gamesetting, String letter) {
    if(gamesetting.wrongWords.contains(letter)){
      return const Color(0xff787c7e);
    }
    if(gamesetting.misplacedWords.contains(letter)){
      return const Color(0xffc9b458);
    }
    if(gamesetting.rightWords.contains(letter)){
      return const Color(0xff6aaa64);
    }
    return const Color(0xffd3d6da);

  }

}

