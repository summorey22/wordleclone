import 'package:flutter_riverpod/flutter_riverpod.dart';

class MySettings{
  int wordSize = 5;
  int attempts = 6;

  MySettings({required this.wordSize, required this.attempts});

  MySettings clone({int? wordSize,int? attempts}){
    return MySettings(wordSize: wordSize ?? this.wordSize, attempts: attempts ?? this. attempts);

  }
}

class SettingsNotifier extends StateNotifier<MySettings>{
  SettingsNotifier() : super(MySettings(wordSize: 5, attempts: 6));

  void updateAttempts(int attempts){
    state = state.clone(attempts: attempts);

  }

  void updateWordSize(int wordSize){
    state = state.clone(wordSize: wordSize);
  }


}
final settingsProvider = StateNotifierProvider<SettingsNotifier, MySettings>(((ref) {
  return SettingsNotifier();
}));