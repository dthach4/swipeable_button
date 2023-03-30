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

  /// The color of the thumb of the button.
  final Color? thumbColor;

  /// The border radius of the button.  
  final BorderRadius? borderRadius;
  
  const SwipeableButton({
    Key? key,
    required this.onSwipe,
    this.height = 40.0,
    this.minThumbWidth = 40.0,
    this.oneTime = true,
    this.label,
    this.color,
    this.thumbColor,
    this.borderRadius,
  }): super(key: key);
  
  @override
  State<SwipeableButton> createState() => _SwipeableButtonState();
  
}

class _SwipeableButtonState extends State<SwipeableButton> {
  
  double? draggingPosition;
  bool hasConfirmed = false;
  
  bool get isDragging => null != draggingPosition;
  
  double get thumbWidth => (null == draggingPosition) ? widget.minThumbWidth : (draggingPosition! + widget.minThumbWidth * 0.5);

  void updateDraggingPosition(double? horizontalPosition, double width) {
    if(hasConfirmed && widget.oneTime) {
      return;
    }
    draggingPosition = (null == horizontalPosition) ? null : horizontalPosition.clamp(widget.minThumbWidth * 0.5, width - widget.minThumbWidth * 0.5);
    if(!hasConfirmed && (horizontalPosition ?? -double.infinity) >= width - widget.minThumbWidth * 0.5) {
      widget.onSwipe();
      hasConfirmed = true;
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
            if(!isDragging && details.localPosition.dx > widget.minThumbWidth) {
              return;
            }
            updateDraggingPosition(details.localPosition.dx, constraints.maxWidth);
          });
        },
        onHorizontalDragUpdate: (DragUpdateDetails details) {
          setState(() {
            if(isDragging) {
              updateDraggingPosition(details.localPosition.dx, constraints.maxWidth);
            }
          });
        },
        onHorizontalDragEnd: (DragEndDetails details) {
          setState(() {
            updateDraggingPosition(null, constraints.maxWidth);
            if(!widget.oneTime) {
              hasConfirmed = false;
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
                    duration: isDragging ? const Duration() : const Duration(milliseconds: 200),
                    curve: Curves.easeOut,
                    width: thumbWidth,
                    child: DecoratedBox(
                      decoration: BoxDecoration(color: widget.thumbColor ?? Theme.of(context).primaryColor),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          SizedBox(
                            width: widget.minThumbWidth,
                            child: hasConfirmed && widget.oneTime
                              ? const Icon(Icons.check, color: Colors.white)
                              : const Icon(Icons.chevron_right, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
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