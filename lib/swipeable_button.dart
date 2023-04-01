/// A swipeable button widget for Flutter.
///
/// This library provides a [SwipeableButton] widget that can be used to
/// implement buttons that respond to swipe gestures. The button can be swiped
/// to the right to perform an action, such as confirming a purchase or starting
/// a voice call.
///
/// Note that [SwipeableButton] should be used for critical actions only, such
/// as deleting data or confirming an irreversible action.
///
/// To use the widget, simply create a new [SwipeableButton] instance and
/// provide the necessary properties, such as the button's background color,
/// icon, and text.
///
/// Example usage:
///
/// ```dart
/// SwipeableButton(
///   height: 40.0,
///   minThumbWidth: 40.0,
///   oneTime: true,
///   label: const Text("Delete"),
///   color: Colors.red,
///   thumbColor: Colors.orange,
///   borderRadius: BorderRadius.circular(5.0),
///   onSwipe: () {
///     // Perform delete action.
///   },
/// )
/// ```
library swipeable_button;

import 'package:flutter/material.dart';

/// A button that triggers an action on swipe.
@immutable
class SwipeableButton extends StatefulWidget {
  /// The action triggered by the button on swipe.
  final VoidCallback onSwipe;

  /// The height of the button.
  final double height;

  /// The initial width of the swipeable part of the button.
  final double minThumbWidth;

  /// Whether the button can be triggered once only.
  final bool oneTime;

  /// The label of the button.
  ///
  /// This widget will be shown below the thumb.
  final Widget? label;

  /// The color of the button.
  final Color? color;

  /// Returns a widget representing the thumb of the button, based on the
  /// `context`, the amount of swipe applied to the button (from 0.0 to
  /// 1.0) as `swipedFraction` and whether the swipe has been completed at least
  /// once as `hasSwiped`.
  final SwipeableButtonThumbBuilder thumbBuilder;

  /// The border radius of the button.
  final BorderRadius? borderRadius;

  /// Creates a new [SwipeableButton] widget.
  const SwipeableButton({
    Key? key,
    required this.onSwipe,
    this.height = 40.0,
    this.minThumbWidth = 40.0,
    this.oneTime = true,
    this.label,
    this.color,
    required this.thumbBuilder,
    this.borderRadius,
  }) : super(key: key);

  /// Creates a [SwipeableButton] via a simplified constructor. It uses a
  /// [SwipeableButtonSimpleThumb], which [thumbColor] and [thumbIconColor] can
  /// be changed. If no [thumbColor] has been provided, it uses the primary
  /// color of the context's theme. If no [thumbIconColor] has been provided, it
  /// uses [Colors.white].
  SwipeableButton.simple({
    Key? key,
    required this.onSwipe,
    this.height = 40.0,
    this.minThumbWidth = 40.0,
    this.oneTime = true,
    this.label,
    this.color,
    Color? thumbColor,
    Color? thumbIconColor,
    this.borderRadius,
  })  : thumbBuilder = SwipeableButtonSimpleThumb.builder(
          color: thumbColor,
          iconColor: thumbIconColor,
          minWidth: minThumbWidth,
        ),
        super(key: key);

  @override
  State<SwipeableButton> createState() => _SwipeableButtonState();
}

class _SwipeableButtonState extends State<SwipeableButton> {
  double? draggingPosition;
  bool hasSwiped = false;

  bool get isDragging => null != draggingPosition;

  double get thumbWidth => (null == draggingPosition)
      ? widget.minThumbWidth
      : (draggingPosition! + widget.minThumbWidth * 0.5);

  void updateDraggingPosition(double? horizontalPosition, double width) {
    if (hasSwiped && widget.oneTime) {
      return;
    }
    draggingPosition = (null == horizontalPosition)
        ? null
        : horizontalPosition.clamp(
            widget.minThumbWidth * 0.5, width - widget.minThumbWidth * 0.5);
    if (!hasSwiped &&
        (horizontalPosition ?? -double.infinity) >=
            width - widget.minThumbWidth * 0.5) {
      widget.onSwipe();
      hasSwiped = true;
    }
  }

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) => SizedBox(
          width: constraints.maxWidth,
          height: widget.height,
          child: GestureDetector(
            onHorizontalDragStart: (DragStartDetails details) {
              setState(() {
                if (!isDragging &&
                    details.localPosition.dx > widget.minThumbWidth) {
                  return;
                }
                updateDraggingPosition(
                    details.localPosition.dx, constraints.maxWidth);
              });
            },
            onHorizontalDragUpdate: (DragUpdateDetails details) {
              setState(() {
                if (isDragging) {
                  updateDraggingPosition(
                      details.localPosition.dx, constraints.maxWidth);
                }
              });
            },
            onHorizontalDragEnd: (DragEndDetails details) {
              setState(() {
                updateDraggingPosition(null, constraints.maxWidth);
                if (!widget.oneTime) {
                  hasSwiped = false;
                }
              });
            },
            child: ClipRRect(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(5.0),
              child: Stack(
                children: <Widget>[
                  SizedBox(
                    width: constraints.maxWidth,
                    height: constraints.maxHeight,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: widget.color ?? Theme.of(context).primaryColor,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: widget.minThumbWidth),
                        child: widget.label ?? Container(),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      AnimatedContainer(
                        duration: isDragging
                            ? const Duration()
                            : const Duration(milliseconds: 200),
                        curve: Curves.easeOut,
                        width: thumbWidth,
                        child: widget.thumbBuilder(
                            context,
                            (widget.minThumbWidth - thumbWidth) /
                                (widget.minThumbWidth - constraints.maxWidth),
                            widget.oneTime && hasSwiped),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}

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

/// A builder for a thumb widget of a [SwipeableButton]. It should be used in
/// as a value for the attribute [SwipeableButton.thumbBuilder].
typedef SwipeableButtonThumbBuilder = Widget Function(
    BuildContext context, double swipedFraction, bool isComplete);
