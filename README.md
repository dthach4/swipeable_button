# Swipeable button

A swipeable button widget.

## Features

- Customizable size: you can manually specify the height of the button and
the width of the thumb.

- Make it either triggerable one time only or infinite times.

- The label shown on the button can be **any** widget

- It can match the style of your application: you can customize the color
of the button, the color of the thumb and the border radius of the button.

## Live Preview

You can check the example page [here](https://dthach4.github.io/swipeable_button/)!

## Getting started

This package has been built for **Flutter**.

Add `swipeable_button: ^0.1.1` to your `pubspec.yaml` dependencies.

You need to import the library in every file that uses this package by using
```dart
import 'package:swipeable_button/swipeable_button.dart';
```

## Usage

The `SwipeableButton` class provides named constructors so it's easier to start
using it.

### Basic usage

You can use the simplified constructor `SwipeableButton.simple` to create a
`SwipeableButton` widget.

```dart
SwipeableButton.simple(
  height: 40.0,
  minThumbWidth: 40.0,
  oneTime: true,
  label: const Text("Delete"),
  color: Colors.red,
  thumbColor: Colors.orange,
  thumbIconColor: Colors.black,
  borderRadius: BorderRadius.circular(5.0),
  onSwipe: () {
    // Perform delete action.
  },
)
```

### Default usage

You can customize the `SwipeableButton` by using the default constructor.

```dart
SwipeableButton(
  height: 40.0,
  minThumbWidth: 40.0,
  oneTime: true,
  label: const Text("Delete"),
  color: Colors.red,
  borderRadius: BorderRadius.circular(5.0),
  thumbBuilder: (BuildContext context,
          double swipedFraction, bool isComplete) =>
      Padding(
        padding: const EdgeInsets.all(2.0),
        child: DecoratedBox(
          decoration: BoxDecoration(
              color: swipedFraction < 0.5
                ? Color.lerp(Colors.red, Colors.yellow, 2.0 * swipedFraction)
                : Color.lerp(Colors.yellow, Colors.green, 2.0 * swipedFraction - 1.0),
              borderRadius: BorderRadius.circular(16.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              SizedBox(
                width: 36.0,
                child: isComplete
                    ? const Icon(Icons.sentiment_very_satisfied,
                        color: Colors.white)
                    : const Icon(Icons.sentiment_very_dissatisfied,
                        color: Colors.white),
              ),
            ],
          ),
        ),
      ),
  onSwipe: () {
    // Perform delete action.
  },
)
```