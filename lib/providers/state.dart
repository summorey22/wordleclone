// ignore_for_file: avoid_print

import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wordle/providers/settings.dart';
import '../data/repo.dart';


class GameState {
  final MySettings settings;
  final List<String> validWords;
  final String correctWord;
  final List<String> attempts;
  final int attempted;
  final List<String> wrongWords;
  final List<String> rightWords;
  final List<String> misplacedWords;

  const GameState({
    required this.validWords,
    required this.correctWord,
    required this.settings,
    required this.attempts,
    required this.attempted,
    required this.misplacedWords,
    required this.rightWords,
    required this.wrongWords,
  });

  GameState clone(
      {List<String>? validWords,
      String? correctWord,
      List<String>? attempts,
      int? attempted,
      List<String>? wrongWords,
  List<String>? rightWords,
  List<String>? misplacedWords,
      }) {
    return GameState(
        validWords: validWords ?? this.validWords,
        correctWord: correctWord ?? this.correctWord,
        settings: settings,
        wrongWords: wrongWords ?? this.wrongWords,
        rightWords: rightWords ?? this.rightWords,
        misplacedWords: misplacedWords ?? this.misplacedWords,
        attempted: attempted ?? this.attempted,
        attempts: attempts ?? this.attempts);
  }
}

class GameStateNotifier extends StateNotifier<GameState> {
  final Random rng = Random();

  GameStateNotifier(MySettings settings)
      : super(GameState(
            validWords: [],
            correctWord: "begin",
            settings: settings,
            attempts: [],
            attempted: 0,
            wrongWords: [],
            misplacedWords: [],
            rightWords: [],));

  Future<void> updateWords() async {
    final words = await loadWords(state.settings.wordSize);
    state = state.clone(
        validWords: words, correctWord: words[rng.nextInt(words.length - 1)]);
  }

  void newCorrectWord() {
    state = state.clone(
        correctWord:
            state.validWords[rng.nextInt(state.validWords.length - 1)]);
  }

  void addwrong(String add){
    state.wrongWords.add(add);
    var bruh = state.wrongWords.toSet().toList();
    state.wrongWords.clear();
    state.wrongWords.addAll(bruh);
  }

  void addright(String add){
    state.rightWords.add(add);
    state.misplacedWords.remove(add);
    var bruh = state.rightWords.toSet().toList();
    state.rightWords.clear();
    state.rightWords.addAll(bruh);
  }

  void addmisplaced(String add){
    if(!state.rightWords.contains(add)){
    state.misplacedWords.add(add);
    var bruh = state.misplacedWords.toSet().toList();
    state.misplacedWords.clear();
    state.misplacedWords.addAll(bruh);
    }
  }

  void updateCurrentAttempt(String key) {
    final attempts = state.attempts;
    if (attempts.length <= state.attempted) {
      attempts.add("");
    }
    var currentAttempt = attempts[state.attempted];

    if (key == "_") {
      // handle enter press

      if (currentAttempt.length < state.settings.wordSize) {
        print("attempted word incomplete");
        return;
      }

      if (!state.validWords.contains(currentAttempt.toLowerCase())) {
        print("not in valid words list");
        return;
      }

      state = state.clone(attempted: state.attempted + 1);
    } else if (key == ">") {
      // handle backpress
      if (currentAttempt.isEmpty) {
        print("cannot backspace on empty string");
        return;
      }
      currentAttempt = currentAttempt.substring(0, currentAttempt.length - 1);
      attempts[state.attempted] = currentAttempt;
      state = state.clone(attempts: attempts);
    } else {
      if (currentAttempt.length >= state.settings.wordSize) {
        print("trying to type word longer than correct word length");
        return;
      }
      currentAttempt += key;
      attempts[state.attempted] = currentAttempt;
      state = state.clone(attempts: attempts);
    }
  }
}

final gameStateProvider =
    StateNotifierProvider<GameStateNotifier, GameState>((ref) {
  final settings = ref.watch(settingsProvider);
  final gameStateNotifier = GameStateNotifier(settings);
  gameStateNotifier.updateWords();
  return gameStateNotifier;
});