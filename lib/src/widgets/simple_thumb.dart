import 'package:flutter/material.dart';
import 'package:swipeable_button/src/typedefs/thumb_builder.dart';

/// A simple thumb widget for a [SwipeableButton].
///
/// This widget represents the thumb of a [SwipeableButton] that can be dragged
/// to trigger it. Its [builder] static method is intended to be used as the
/// `thumbBuilder` property of a [SwipeableButton].
///
/// The [SwipeableButton.simple] constructor implicitly uses this widget.
///
/// Example usage:
///
/// ```dart
/// SwipeableButton(
///   thumbBuilder: SwipeableButtonSimpleThumb.builder({
///     color: Colors.blue.shade200,
///     textColor: Colors.black,
///   }),
///   ...
/// )
/// ```
@immutable
class SwipeableButtonSimpleThumb extends StatelessWidget {
  /// The color of the thumb.
  final Color color;

  /// The color of the icon on the thumb.
  final Color iconColor;

  /// The minimum width of the thumb.
  final double minWidth;

  /// Whether the thumb has been swiped to trigger a one-time [SwipeableButton]
  /// action (i.e. [SwipeableButton.oneTime] is `true`).
  final bool isComplete;

  /// Creates a new [SwipeableButtonSimpleThumb] widget. This should be used
  /// inside of a [SwipeableButtonThumbBuilder] function.
  const SwipeableButtonSimpleThumb({
    Key? key,
    required this.color,
    required this.iconColor,
    required this.minWidth,
    required this.isComplete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: BoxDecoration(
          color: color,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            SizedBox(
              width: minWidth,
              child: isComplete
                  ? Icon(Icons.check, color: iconColor)
                  : Icon(Icons.chevron_right, color: iconColor),
            ),
          ],
        ),
      );

  /// Returns a builder for a [SwipeableButtonSimpleThumb] to be used in the
  /// constructor of [SwipeableButton]. The [minWidth] parameter should be the
  /// same as the [SwipeableButton.minThumbWidth] attribute.
  static SwipeableButtonThumbBuilder builder(
      {Color? color, Color? iconColor, double? minWidth}) {
    return (BuildContext context, double swipedFraction, bool isComplete) =>
        SwipeableButtonSimpleThumb(
          color: color ?? Theme.of(context).primaryColor,
          iconColor: iconColor ?? Colors.white,
          minWidth: minWidth ?? 40.0,
          isComplete: isComplete,
        );
  }
}
