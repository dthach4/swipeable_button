import 'package:flutter/material.dart';
import 'package:swipeable_button/swipeable_button.dart';

void main() => runApp(const SwipeableButtonExample1());

@immutable
class SwipeableButtonExample1 extends StatelessWidget {

  const SwipeableButtonExample1({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) => const MaterialApp(
    home: SwipeableButtonExample1HomePage(),
  );

}

@immutable
class SwipeableButtonExample1HomePage extends StatelessWidget {

  const SwipeableButtonExample1HomePage({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text("Swipeable Button Example 1"),
    ),
    body: Center(
      child: SizedBox(
        width: 200.0,
        child: SwipeableButton(
          label: const Center(child: Text("Swipe me!", style: TextStyle(color: Colors.white, fontSize: 16.0))),
          color: Colors.blue.shade400,
          thumbColor: Colors.blue.shade800,
          onSwipe: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Thank you for swiping!"),)
            );
          }
        ),
      ),
    ),
  );

}