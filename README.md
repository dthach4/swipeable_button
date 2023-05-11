# Swipeable button

A swipeable button widget.

## Features

- Customizable size: you can manually specify the height of the button. It
  takes the width from its parent element.

- Make it either triggerable one time only or infinite times.

- The label shown on the button can be **any** widget

- It can match the style of your application: you can customize the color
  of the button and fully customize the thumb!

## Live Preview

You can check the example page [here](https://dthach4.github.io/swipeable_button/)!

## Getting started

This package has been built for **Flutter**.

Add `swipeable_button: ^0.2.0` to your `pubspec.yaml` dependencies.

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
  label: const Center(
    child: Text(
      "Delete",
      style: TextStyle(
        color: Colors.white,
        fontSize: 16.0,
      ),
    ),
  ),
  height: 40.0,
  minThumbWidth: 40.0,
  oneTime: true,
  color: Colors.red,
  thumbColor: Colors.orange,
  thumbIconColor: Colors.black,
  borderRadius: BorderRadius.circular(5.0),
  onSwipe: () {
    // Perform delete action.
  },
)
```

There is also a simplified constructor `SwipaebleButton.simpleSlidable` that
creates a `SwipeableButton` widget with a slidable thumb.

```dart
SwipeableButton.simpleSlidable(
  label: const Center(
    child: Text(
      "Delete",
      style: TextStyle(
        color: Colors.white,
        fontSize: 16.0,
      ),
    ),
  ),
  height: 40.0,
  minThumbWidth: 40.0,
  oneTime: true,
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