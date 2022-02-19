import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wordle/providers/state.dart';

class MyCell extends ConsumerWidget{
  final int pos;
  final String letter;
  final String correctWord;
  final bool attempted;
  final String word;
  const MyCell({Key? key, required this.letter, required this.correctWord, required this.attempted, required this.pos, required this.word}) : super(key: key);

  Color? getBgColor([GameStateNotifier? gameprovider]){
    if (!attempted) return null;
    if(correctWord == word){
      return const Color(0xff6aaa64);

    }
    if (!correctWord.contains(letter)) {
      if(gameprovider!=null){
        gameprovider.addwrong(letter);
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
    final gameprovider = ref.read(gameStateProvider.notifier);
    return Container(
      width: 60,
      height: 60,
      alignment: Alignment.center,
      margin: const EdgeInsets.all(3),
      decoration: BoxDecoration(border: Border.all(color: colorSet(), width: 1), color: getBgColor(gameprovider)),
      child: Text(letter.toUpperCase(), style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold, color:  getTextColor()),),
    );
  }

  colorSet() {
    if(letter!=""){
      if(getBgColor()!=null){
      return Colors.grey;
    }
      return Colors.black;
    }
    
      return Colors.grey;

  }

  getTextColor() {
    if(!attempted){
      return Colors.black;
    }
    return Colors.white;
  }

}
