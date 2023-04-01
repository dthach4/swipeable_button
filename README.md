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

Add `swipeable_button: ^0.0.1` to your `pubspec.yaml` dependencies.

You need to import the library in every file that uses this package by using
```dart
import 'package:swipeable_button/swipeable_button.dart';
```

## Usage

Place the button wherever you want by creating a `SwipeableButton` widget.

```dart
SwipeableButton(
  height: 40.0,
  minThumbWidth: 40.0,
  oneTime: true,
  label: const Text("Delete"),
  color: Colors.red,
  thumbColor: Colors.orange,
  borderRadius: BorderRadius.circular(5.0),
  onSwipe: () {
    // Perform delete action.
  },
)
```
