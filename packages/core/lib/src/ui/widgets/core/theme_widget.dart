// Generated By XFlutter Cli.
//
// more info: https://xflutter-cli.com
import 'package:flutter/material.dart';

class ThemeWidget extends StatelessWidget {
  /// callback which wrap your widgets in current appTheme
  final Widget Function(BuildContext context, ThemeData theme) builder;

  /// widget with state management for App [ThemeData]
  const ThemeWidget({required this.builder, super.key});

  @override
  Widget build(BuildContext context) {
    return builder(context, Theme.of(context));
  }
}
