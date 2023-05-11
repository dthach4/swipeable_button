import 'package:flutter/material.dart';
import 'package:swipeable_button/src/typedefs/thumb_builder.dart';

/// A simple slidable thumb widget for a [SwipeableButton].
///
/// This widget represents the thumb of a [SwipeableButton] that can be dragged
/// to trigger it. Its [builder] static method is intended to be used as the
/// `thumbBuilder` property of a [SwipeableButton].
///
/// The [SwipeableButton.simpleSlidable] constructor implicitly uses this widget.
///
/// Example usage:
///
/// ```dart
/// SwipeableButton(
///   thumbBuilder: SwipeableButtonSimpleSlidableThumb.builder({
///     color: Colors.blue.shade200,
///     textColor: Colors.black,
///   }),
///   ...
/// )
/// ```
@immutable
class SwipeableButtonSimpleSlidableThumb extends StatelessWidget {
  /// The color of the thumb
  final Color color;

  /// The color of the icon on the thumb.
  final Color iconColor;

  /// The width of the thumb. This includes the padding, so the content area
  /// may be smaller than the specified width.
  final double width;

  /// The border radius of the thumb.
  final double borderRadius;

  /// The padding of the thumb. This has the effect of making the actual thumb
  /// look smaller than specified.
  final double padding;

  /// Whether the thumb has been swiped to trigger a one-time [SwipeableButton]
  /// action (i.e. [SwipeableButton.oneTime] is `true`).
  final bool isComplete;

  /// The icon shown on the thumb.
  final IconData icon;

  /// The icon shown on the thumb after the button has been triggered.
  final IconData iconCompleted;

  /// Creates a new [SwipeableButtonSimpleSlidableThumb] widget. This should be used
  /// inside of a [SwipeableButtonThumbBuilder] function.
  const SwipeableButtonSimpleSlidableThumb({
    Key? key,
    required this.color,
    required this.iconColor,
    required this.width,
    this.borderRadius = 3.0,
    this.padding = 4.0,
    required this.isComplete,
    this.icon = Icons.chevron_right,
    this.iconCompleted = Icons.check,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: width,
            height: double.infinity,
            child: Padding(
              padding: EdgeInsets.all(padding),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadius),
                  color: color,
                ),
                child: Center(
                  child:
                      Icon(isComplete ? iconCompleted : icon, color: iconColor),
                ),
              ),
            ),
          ),
        ],
      );

  /// Returns a builder for a [SwipeableButtonThumbBuilder] to be used in the
  /// constructor of [SwipeableButton]. The [width] parameter should be the
  /// same as the [SwipeableButton.minThumbWidth] attribute.
  static SwipeableButtonThumbBuilder builder({
    Color? color,
    Color? iconColor,
    double? width,
    double? borderRadius,
    double? padding,
    IconData? icon,
    IconData? iconCompleted,
  }) =>
      (BuildContext context, double swipedFraction, bool isComplete) =>
          SwipeableButtonSimpleSlidableThumb(
            color: color ?? Theme.of(context).primaryColor,
            iconColor: iconColor ?? Colors.white,
            width: width ?? 40.0,
            borderRadius: borderRadius ?? 3.0,
            padding: padding ?? 4.0,
            isComplete: isComplete,
            icon: icon ?? Icons.chevron_right,
            iconCompleted: iconCompleted ?? Icons.check,
          );
}
