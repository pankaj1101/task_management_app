import 'package:flutter/material.dart';

/// A reusable widget that centers its child content horizontally
/// and constrains its maximum width to 600 pixels.
///
/// This is essential for ensuring a mobile-first design looks clean
/// on tablets and desktops by preventing content from stretching too wide.
class ResponsiveCenterBody extends StatelessWidget {
  /// The content to be displayed in the body.
  final Widget child;

  /// Optional padding to apply around the centered content.
  final EdgeInsetsGeometry padding;

  /// The maximum width the content should occupy.
  /// Defaults to the standard mobile breakpoint of 600.
  final double maxWidth;

  const ResponsiveCenterBody({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(24.0),
    this.maxWidth = 600.0,
  });

  @override
  Widget build(BuildContext context) {
    // 1. Center the entire constrained block horizontally on the screen.
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: Padding(
          padding: padding,
          // 2. The actual content of the screen.
          child: child,
        ),
      ),
    );
  }
}
