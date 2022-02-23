import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wordle/providers/settings.dart';
import 'package:wordle/providers/state.dart';
import 'package:wordle/widgets/wordle.dart';

class MyDialog extends ConsumerStatefulWidget {
  final bool isDark;
  const MyDialog({Key? key, required this.isDark}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyDialog();
}

class _MyDialog extends ConsumerState<MyDialog> {
  @override
  Widget build(BuildContext context) {
    if (ref.watch(gameStateProvider).errors.contains("Y")) {
      return Container(
        color: Colors.black.withOpacity(0.5),
        child: Container(
          margin: getMargin(),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: getColor(widget.isDark),
          ),
          padding: const EdgeInsets.all(0.5),
          child: Column(
            children: [
              Row(
                //mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.close,
                      color: getTextColor(widget.isDark),
                    ),
                    splashRadius: 1,
                    onPressed: () {
                      ref.watch(gameStateProvider).errors.clear();
                       Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder:
                                        (context, animation1, animation2) =>
                                            const MyWordle(),
                                    transitionDuration: Duration.zero,
                                    reverseTransitionDuration: Duration.zero,
                                  ),
                                );
                    },
                  ),
                  const Spacer(),
                  IconButton(
                    icon: Icon(
                      Icons.refresh,
                      color: getTextColor(widget.isDark),
                    ),
                    splashRadius: 1,
                    onPressed: () {
                      ref.watch(gameStateProvider).errors.clear();
                       ref.read(settingsProvider.notifier).updateAttempts(ref.read(settingsProvider).attempts);
                       Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder:
                                        (context, animation1, animation2) =>
                                            const MyWordle(),
                                    transitionDuration: Duration.zero,
                                    reverseTransitionDuration: Duration.zero,
                                  ),
                                );
                    },
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(top: 25),
                        child: const Text(
                          "YOU WON!",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.lightGreen,
                              fontSize: 50),
                        )),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      child: Text(
                        "YOUR SCORE",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: getTextColor(widget.isDark)),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5, bottom: 60),
                      child: Text(
                        getText(),
                        style: TextStyle(
                            color: getTextColor(widget.isDark), fontSize: 45),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }
    if(ref.watch(settingsProvider).attempts == ref.watch(gameStateProvider).attempted){
      return Align(
        alignment: Alignment.topCenter,
        child: Container(
          margin: const EdgeInsets.only(top: 30),
          height: 50,
          width: 95,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.white),
          alignment: Alignment.center,
          padding: const EdgeInsets.all(5),
          child: Text(ref.watch(gameStateProvider).correctWord.toUpperCase(), style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
        )),
      );

    }
    return Container();
  }

  getMargin() {
    if (MediaQuery.of(context).size.width > 700) {
      return EdgeInsets.only(
          top: MediaQuery.of(context).size.height / 2 - 200,
          bottom: MediaQuery.of(context).size.height / 2 - 200,
          right: MediaQuery.of(context).size.width / 2 - 250,
          left: MediaQuery.of(context).size.width / 2 - 250);
    } else {
      return EdgeInsets.only(
          top: MediaQuery.of(context).size.height / 2 - 200,
          bottom: MediaQuery.of(context).size.height / 2 - 200,
          right: 25,
          left: 25);
    }
  }

  getColor(bool isDark) {
    if (isDark) {
      return const Color(0xff3a3a3c);
    }
    return Colors.white;
  }

  getTextColor(bool isDark) {
    if (isDark) {
      return Colors.white;
    }
    return Colors.black;
  }

  String getText() {
    final attempts = ref.watch(settingsProvider).attempts;
    final attempted = ref.watch(gameStateProvider).attempted;
    const totalscore = 10;
    final playerscore = ((attempts - attempted + 1)/attempts)*10;

    return "${playerscore.toInt()}/$totalscore";

  }
}
