import 'package:flutter/material.dart';

class MyCell extends StatefulWidget{
  final int pos;
  final String letter;
  final String correctWord;
  final bool attempted;
  const MyCell({Key? key, required this.letter, required this.correctWord, required this.attempted, required this.pos}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyCell();

}

class _MyCell extends State<MyCell>{
  Color? getBgColor(){
    if (!widget.attempted) return null;
    if (!widget.correctWord.contains(widget.letter)) return Colors.grey;
    if (widget.correctWord.indexOf(widget.letter) == widget.pos) return const Color(0xff6aaa64);
    return const Color(0xffc9b458);
  }
    
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      alignment: Alignment.center,
      margin: const EdgeInsets.all(3),
      decoration: BoxDecoration(border: Border.all(color: colorSet(), width: 1), color: getBgColor()),
      child: Text(widget.letter.toUpperCase(), style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold, color:  getTextColor()),),
    );
  }

  colorSet() {
    if(widget.letter!=""){
      if(getBgColor()!=null){
      return Colors.grey;
    }
      return Colors.black;
    }
    
      return Colors.grey;

  }

  getTextColor() {
    if(!widget.attempted){
      return Colors.black;
    }
    return Colors.white;
  }

}