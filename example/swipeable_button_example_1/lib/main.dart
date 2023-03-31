import 'package:flutter/material.dart';
import 'package:swipeable_button/swipeable_button.dart';

void main() => runApp(const SwipeableButtonExample1());

@immutable
class SwipeableButtonExample1 extends StatelessWidget {
  const SwipeableButtonExample1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const MaterialApp(
        home: SwipeableButtonExample1HomePage(),
      );
}

@immutable
class SwipeableButtonExample1HomePage extends StatelessWidget {
  const SwipeableButtonExample1HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Swipeable Button Example 1"),
        ),
        body: Center(
          child: SizedBox(
            width: 300.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SwipeableButton.simple(
                      label: const Center(
                          child: Text("Simple blue button",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.0))),
                      color: Colors.blue.shade400,
                      thumbColor: Colors.blue.shade800,
                      onSwipe: () {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Thank you for swiping!"),
                        ));
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SwipeableButton.simple(
                      label: const Center(
                          child: Text("Simple red button",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.0))),
                      color: Colors.red.shade400,
                      thumbColor: Colors.red.shade800,
                      onSwipe: () {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Thank you for swiping!"),
                        ));
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SwipeableButton(
                      label: const Center(
                          child: Text("Red to green thumb",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.0))),
                      color: Colors.blue.shade400,
                      thumbBuilder: (BuildContext context,
                              double swipedFraction, bool hasSwiped) =>
                          DecoratedBox(
                            decoration: BoxDecoration(
                                color: Color.lerp(
                                    Colors.red, Colors.green, swipedFraction)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                SizedBox(
                                  width: 40.0,
                                  child: hasSwiped
                                      ? const Icon(Icons.check,
                                          color: Colors.white)
                                      : const Icon(Icons.chevron_right,
                                          color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                      onSwipe: () {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Thank you for swiping!"),
                        ));
                      }),
                ),
              ],
            ),
          ),
        ),
      );
}
