// Generated By XFlutter Cli.
//
// more info: https://xflutter-cli.com
import 'package:flutter/material.dart';

class CustomizedAnimatedWidget extends StatefulWidget {
  /// [child] is wrapped [Widget] inside [CustomizedAnimatedWidget].
  final Widget child;

  /// animation [Duration] default is Duration(milliseconds: 300).
  final Duration duration;

  /// animation sliding value.
  final double from;

  const CustomizedAnimatedWidget({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 300),
    this.from = 30,
  });

  @override
  State<CustomizedAnimatedWidget> createState() => CustomizedAnimatedWidgetState();
}

class CustomizedAnimatedWidgetState extends State<CustomizedAnimatedWidget> {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: widget.duration,
      tween: Tween<double>(begin: widget.from, end: 0),
      child: widget.child,
      builder: (context, value, child) => Transform.translate(
        offset: Offset(0, value),
        child: TweenAnimationBuilder(
          duration: widget.duration,
          tween: Tween<double>(begin: 0, end: 1),
          child: child,
          builder: (context, opacity, child) => Opacity(
            opacity: opacity,
            child: child,
          ),
        ),
      ),
    );
  }
}

extension WidgetsUtils on Widget {
  /// animate [Widget] on appear
  Widget withAnimation({double from = 30}) {
    return CustomizedAnimatedWidget(from: from, child: this);
  }
}
