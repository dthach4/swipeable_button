import 'package:flutter/material.dart';

/// A builder for a thumb widget of a [SwipeableButton]. It should be used in
/// as a value for the attribute [SwipeableButton.thumbBuilder].
typedef SwipeableButtonThumbBuilder = Widget Function(
    BuildContext context, double swipedFraction, bool isComplete);
