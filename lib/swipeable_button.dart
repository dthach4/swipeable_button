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
///  label: const Center(
///      child: Text(
///        "Delete",
///        style: TextStyle(
///          color: Colors.white,
///          fontSize: 16.0,
///        ),
///      ),
///   ),
///   height: 40.0,
///   minThumbWidth: 40.0,
///   oneTime: true,
///   color: Colors.blue,
///   borderRadius: BorderRadius.circular(5.0),
///   thumbBuilder: (BuildContext context, double swipedFraction, bool isComplete) =>
///     SwipeableButtonSimpleThumb(
///       color: Color.lerp(Colors.red, Colors.green, swipedFraction) ?? Colors.red,
///       iconColor: Colors.black,
///       minWidth: 40.0,
///       isComplete: isComplete,
///     ),
///   onSwipe: () {
///     // Perform delete action.
///   },
/// )
/// ```
library swipeable_button;

export 'src/typedefs/thumb_builder.dart';
export 'src/widgets/thumbs/simple_thumb.dart';
export 'src/widgets/swipeable_button.dart';
