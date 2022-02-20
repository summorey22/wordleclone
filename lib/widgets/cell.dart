import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wordle/providers/state.dart';

class MyCell extends ConsumerWidget{
  final bool isDark;
  final int pos;
  final String letter;
  final String correctWord;
  final bool attempted;
  final String word;
  final int wordSize;
  final int attempts;
  const MyCell({Key? key, required this.letter, required this.correctWord, required this.attempted, required this.pos, required this.word, required this.isDark, required this.wordSize, required this.attempts}) : super(key: key);

  Color? getBgColor([BuildContext? context,GameStateNotifier? gameprovider, GameState? gameset]){
    if (!attempted) return null;
    if(correctWord == word){
      gameset?.rightWords.clear();
      gameset?.misplacedWords.clear();
      for (int i=0;i<word.length;i++){
        gameset?.rightWords.add(word[i]);
      }
      return const Color(0xff6aaa64);

    }
    if (!correctWord.contains(letter)) {
      if(gameprovider!=null){
        gameprovider.addwrong(letter);
      }
      if(isDark){
        return const Color(0xff3a3a3c);
      }
      return Colors.grey;
    }
    if (correctWord.indexOf(letter) == pos) {
      if(gameprovider!=null){
        gameprovider.addright(letter);

      }
      return const Color(0xff6aaa64);
    }
    if(gameprovider!=null){
       gameprovider.addmisplaced(letter);
    } 
    return const Color(0xffc9b458);
  }
    
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameset = ref.watch(gameStateProvider);
    final gameprovider = ref.read(gameStateProvider.notifier);
    return Container(
      width: getSize(wordSize, context, attempts),
      height: getSize(wordSize, context, attempts),
      alignment: Alignment.center,
      margin: const EdgeInsets.all(3),
      decoration: BoxDecoration(border: Border.all(color: colorSet(), width: 1), color: getBgColor(context,gameprovider, gameset)),
      child: Text(letter.toUpperCase(), style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold, color:  getTextColor()),),
    );
  }

  colorSet() {
    if(isDark){
      if(letter!=""){
        if(getBgColor()!=null){
          return const Color(0xff565758);
        }
        return const Color(0xff3a3a3c);
      }
      return const Color(0xff565758);
    }
    if(letter!=""){
      if(getBgColor()!=null){
      return Colors.grey;
    }
      return Colors.black;
    }
    
      return Colors.grey;

  }

  getTextColor() {
    if(isDark){
    return Colors.white;

    }
    if(!attempted){
      return Colors.black;
    }
    return Colors.white;
  }

  getSize(int wordSize, BuildContext context, int attempts) {
    if((wordSize == 6 || attempts == 6) && MediaQuery.of(context).size.height<700){
      return 45;
    }
    if(wordSize == 6 && MediaQuery.of(context).size.width<600){
      return 45;
    }
    return 60;
  }

}
