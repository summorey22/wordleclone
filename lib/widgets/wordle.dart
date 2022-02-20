import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wordle/providers/state.dart';
import 'package:wordle/widgets/grid.dart';
import 'package:wordle/widgets/keyboard.dart';
import '../providers/settings.dart';

class MyWordle extends ConsumerStatefulWidget {
  const MyWordle({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyWordle();
}

class _MyWordle extends ConsumerState<MyWordle> {
  bool isDark = WidgetsBinding.instance?.window.platformBrightness == Brightness.dark;

  getHeight(BuildContext context) {
    if (MediaQuery.of(context).size.width < 600) {
      return 15;
    }
    return 40;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: getColor(isDark),
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 50,
        iconTheme: IconThemeData(
          color: getText(isDark),
        ),
        actions: const[
          RestartButton(),
        ],
        title: Text(
          "WORDLE",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: getText(isDark)),
        ),
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
                    const Icon(
                      Icons.settings_applications_outlined,
                      color: Colors.black,
                    ),
                    const VerticalDivider(
                      color: Colors.black,
                    ),
                    const Text(
                      "Settings",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black),
                    ),
                    const Spacer(),
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: IconButton(
                        splashRadius: 25,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.close),
                      ),
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
              child: Row(children: [
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
              margin: const EdgeInsets.only(top: 25, left: 20, right: 25),
              child: const Divider(),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, top: 5),
              child: Row(
                children: [
                  const Text("Dark Mode"),
                  const Spacer(),
                  Container(
                    margin: const EdgeInsets.only(right: 25),
                    child: Transform.scale(
                      scale: 0.75,
                      child: CupertinoSwitch(
                        trackColor: const Color(0xffc9b458),
                        activeColor: const Color(0xff6aaa64),
                        value: isDark,
                        onChanged: (bool s) {
                          setState(() {
                            isDark = s;
                          });
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5, left: 20, right: 25),
              child: const Divider()),
          ],
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Shortcuts(
          shortcuts: {
            LogicalKeySet(LogicalKeyboardKey.keyA): AddA(),
            LogicalKeySet(LogicalKeyboardKey.keyB): AddB(),
            LogicalKeySet(LogicalKeyboardKey.keyC): AddC(),
            LogicalKeySet(LogicalKeyboardKey.keyD): AddD(),
            LogicalKeySet(LogicalKeyboardKey.keyE): AddE(),
            LogicalKeySet(LogicalKeyboardKey.keyF): AddF(),
            LogicalKeySet(LogicalKeyboardKey.keyG): AddG(),
            LogicalKeySet(LogicalKeyboardKey.keyH): AddH(),
            LogicalKeySet(LogicalKeyboardKey.keyI): AddI(),
            LogicalKeySet(LogicalKeyboardKey.keyJ): AddJ(),
            LogicalKeySet(LogicalKeyboardKey.keyK): AddK(),
            LogicalKeySet(LogicalKeyboardKey.keyL): AddL(),
            LogicalKeySet(LogicalKeyboardKey.keyM): AddM(),
            LogicalKeySet(LogicalKeyboardKey.keyN): AddN(),
            LogicalKeySet(LogicalKeyboardKey.keyO): AddO(),
            LogicalKeySet(LogicalKeyboardKey.keyP): AddP(),
            LogicalKeySet(LogicalKeyboardKey.keyQ): AddQ(),
            LogicalKeySet(LogicalKeyboardKey.keyR): AddR(),
            LogicalKeySet(LogicalKeyboardKey.keyS): AddS(),
            LogicalKeySet(LogicalKeyboardKey.keyT): AddT(),
            LogicalKeySet(LogicalKeyboardKey.keyU): AddU(),
            LogicalKeySet(LogicalKeyboardKey.keyV): AddV(),
            LogicalKeySet(LogicalKeyboardKey.keyW): AddW(),
            LogicalKeySet(LogicalKeyboardKey.keyX): AddX(),
            LogicalKeySet(LogicalKeyboardKey.keyY): AddY(),
            LogicalKeySet(LogicalKeyboardKey.keyZ): AddZ(),
            LogicalKeySet(LogicalKeyboardKey.enter): Addent(),
            LogicalKeySet(LogicalKeyboardKey.backspace): Addback(),
          },
          child: Actions(
            actions: {
              Addback: CallbackAction(onInvoke: ((intent) => ref.read(gameStateProvider.notifier).updateCurrentAttempt(">"))),
              Addent: CallbackAction(onInvoke: ((intent) => ref.read(gameStateProvider.notifier).updateCurrentAttempt("_"))),
              AddA: CallbackAction(onInvoke: ((intent) => ref.read(gameStateProvider.notifier).updateCurrentAttempt("a"))),
              AddB: CallbackAction(onInvoke: ((intent) => ref.read(gameStateProvider.notifier).updateCurrentAttempt("b"))),
              AddC: CallbackAction(onInvoke: ((intent) => ref.read(gameStateProvider.notifier).updateCurrentAttempt("c"))),
              AddD: CallbackAction(onInvoke: ((intent) => ref.read(gameStateProvider.notifier).updateCurrentAttempt("d"))),
              AddE: CallbackAction(onInvoke: ((intent) => ref.read(gameStateProvider.notifier).updateCurrentAttempt("e"))),
              AddF: CallbackAction(onInvoke: ((intent) => ref.read(gameStateProvider.notifier).updateCurrentAttempt("f"))),
              AddG: CallbackAction(onInvoke: ((intent) => ref.read(gameStateProvider.notifier).updateCurrentAttempt("g"))),
              AddH: CallbackAction(onInvoke: ((intent) => ref.read(gameStateProvider.notifier).updateCurrentAttempt("h"))),
              AddI: CallbackAction(onInvoke: ((intent) => ref.read(gameStateProvider.notifier).updateCurrentAttempt("i"))),
              AddJ: CallbackAction(onInvoke: ((intent) => ref.read(gameStateProvider.notifier).updateCurrentAttempt("j"))),
              AddK: CallbackAction(onInvoke: ((intent) => ref.read(gameStateProvider.notifier).updateCurrentAttempt("k"))),
              AddL: CallbackAction(onInvoke: ((intent) => ref.read(gameStateProvider.notifier).updateCurrentAttempt("l"))),
              AddM: CallbackAction(onInvoke: ((intent) => ref.read(gameStateProvider.notifier).updateCurrentAttempt("m"))),
              AddN: CallbackAction(onInvoke: ((intent) => ref.read(gameStateProvider.notifier).updateCurrentAttempt("n"))),
              AddO: CallbackAction(onInvoke: ((intent) => ref.read(gameStateProvider.notifier).updateCurrentAttempt("o"))),
              AddP: CallbackAction(onInvoke: ((intent) => ref.read(gameStateProvider.notifier).updateCurrentAttempt("p"))),
              AddQ: CallbackAction(onInvoke: ((intent) => ref.read(gameStateProvider.notifier).updateCurrentAttempt("q"))),
              AddR: CallbackAction(onInvoke: ((intent) => ref.read(gameStateProvider.notifier).updateCurrentAttempt("r"))),
              AddS: CallbackAction(onInvoke: ((intent) => ref.read(gameStateProvider.notifier).updateCurrentAttempt("s"))),
              AddT: CallbackAction(onInvoke: ((intent) => ref.read(gameStateProvider.notifier).updateCurrentAttempt("t"))),
              AddU: CallbackAction(onInvoke: ((intent) => ref.read(gameStateProvider.notifier).updateCurrentAttempt("u"))),
              AddV: CallbackAction(onInvoke: ((intent) => ref.read(gameStateProvider.notifier).updateCurrentAttempt("v"))),
              AddW: CallbackAction(onInvoke: ((intent) => ref.read(gameStateProvider.notifier).updateCurrentAttempt("w"))),
              AddX: CallbackAction(onInvoke: ((intent) => ref.read(gameStateProvider.notifier).updateCurrentAttempt("x"))),
              AddY: CallbackAction(onInvoke: ((intent) => ref.read(gameStateProvider.notifier).updateCurrentAttempt("y"))),
              AddZ: CallbackAction(onInvoke: ((intent) => ref.read(gameStateProvider.notifier).updateCurrentAttempt("z"))),
            },
            child: Focus(
              autofocus: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                        alignment: Alignment.center, child: MyGrid(isDark: isDark,)),
                  MyKeyboard(isDark: isDark),
                ]),
            ),
          ),)
      ),
    );
  }

  getColor(bool isDark) {
    if (isDark) {
      return const Color(0xff121213);
    }
    return Colors.white;
  }

  getText(bool isDark) {
    if (isDark) {
      return Colors.white;
    }
    return Colors.black;
  }

  
}
//Intent class for keyboard responses
class AddA extends Intent {}
class AddB extends Intent {}
class AddC extends Intent {}
class AddD extends Intent {}
class AddE extends Intent {}
class AddF extends Intent {}
class AddG extends Intent {}
class AddH extends Intent {}
class AddI extends Intent {}
class AddJ extends Intent {}
class AddK extends Intent {}
class AddL extends Intent {}
class AddM extends Intent {}
class AddN extends Intent {}
class AddO extends Intent {}
class AddP extends Intent {}
class AddQ extends Intent {}
class AddR extends Intent {}
class AddS extends Intent {}
class AddT extends Intent {}
class AddU extends Intent {}
class AddV extends Intent {}
class AddW extends Intent {}
class AddX extends Intent {}
class AddY extends Intent {}
class AddZ extends Intent {}
class Addent extends Intent {}
class Addback extends Intent {}

class RestartButton extends ConsumerWidget {
  const RestartButton({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gamesetting = ref.watch(settingsProvider);
    final gamesettingsprovider = ref.read(settingsProvider.notifier);
    return Container(
            margin: const EdgeInsets.only(right: 5),
            child: IconButton(
              splashRadius: 18,
              onPressed: (){
                gamesettingsprovider.updateAttempts(gamesetting.attempts);
                 Navigator.pushReplacement(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder:
                                        (context, animation1, animation2) =>
                                            const MyWordle(),
                                    transitionDuration: Duration.zero,
                                    reverseTransitionDuration: Duration.zero,
                                  ),
                                );
              }, icon: const Icon(Icons.refresh)),
          );
  }

}

class TextToggle extends ConsumerWidget {
  const TextToggle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gamesettings = ref.watch(settingsProvider);
    final gamesettingsnotifier = ref.read(settingsProvider.notifier);
    var text = "LOW";

    void _updateAttempts() {
      var newAttempts = 6;
      if (gamesettings.attempts == 4) newAttempts = 5;
      if (gamesettings.attempts == 5) newAttempts = 6;
      if (gamesettings.attempts == 6) newAttempts = 4;
      gamesettingsnotifier.updateAttempts(newAttempts);
    }

    switch (gamesettings.attempts) {
      case 4:
        text = "HIGH";
        break;
      case 5:
        text = "MEDIUM";
        break;
      case 6:
      default:
        "LOW";
        break;
    }

    return SizedBox(
      width: 90,
      child: OutlinedButton(onPressed: _updateAttempts, child: Text(text, style: TextStyle(color: getColor(text)),)),
    );
  }

  getColor(String text) {
    if(text == "LOW"){
      return Colors.lightGreen;
    }
    if(text == "MEDIUM") {
      return Colors.amber;
    }
    return Colors.red;
  }
}

class WordSizeToggle extends ConsumerWidget {
  const WordSizeToggle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gamesettings = ref.watch(settingsProvider);
    final gamesettingsnotifier = ref.read(settingsProvider.notifier);

    void _updateWordsize() {
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


