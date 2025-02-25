// Generated By XFlutter Cli.
//
// more info: https://xflutter-cli.com
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// set application on-launch UI configuration
void uiConfig(BuildContext context) {
  _setupOrientation(context);
}

/// set screen orientation depending on screen size,
///
/// if device is tablet -> set orientation [DeviceOrientation.landscapeRight] and [DeviceOrientation.landscapeLeft],
/// if device is mobile -> set orientation [DeviceOrientation.portraitUp] and [DeviceOrientation.portraitDown].
void _setupOrientation(BuildContext context) {
  const tabletOrientation = [DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft];
  const mobileOrientation = [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown];
  SystemChrome.setPreferredOrientations(isTablet(context) ? tabletOrientation : mobileOrientation);
}

/// detect if device is tablet depending on device screen size.
bool isTablet(BuildContext context) {
  final data = MediaQueryData.fromView(View.of(context));
  return data.size.shortestSide > 600;
}

/// get screen [Size]
Size screenSize(BuildContext context) {
  return MediaQuery.of(context).size;
}

/// hide screen status bar
void hideStatusBar() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
}

/// show screen status bar
void showStatusBar() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
}

/// [function] immediately will be called once upon screen has finishes rendering the layout
void runAfterBuild(Function() function) {
  WidgetsBinding.instance.addPostFrameCallback((_) => function());
}

/// hide current focused view
void hideSoftKeyboard(BuildContext context) {
  FocusScope.of(context).requestFocus(FocusNode());
}

/// display snackBar
void showSnackBar({
  required BuildContext context,
  required String message,
  Function()? callback,
  TextStyle? textStyle,
  String? action,
  Color? backgroundColor,
}) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(message, style: textStyle ?? const TextStyle(color: Colors.white)),
        backgroundColor: backgroundColor ?? Theme.of(context).colorScheme.onSurface,
        action: SnackBarAction(
          label: action ?? 'Ok',
          textColor: Colors.white,
          onPressed: callback ?? () {},
        ),
      ),
    );
}

/// display confirmation adaptive alert dialog
Future<T?> showConformationDialog<T>({
  required BuildContext context,
  required String title,
  required String content,
  required String cancelText,
  required String confirmText,
  required Function() onConfirm,
  TextStyle? confirmTextStyle,
}) async {
  return showAdaptiveDialog<T>(
    context: context,
    useSafeArea: true,
    barrierDismissible: true,
    builder: (context) => AlertDialog.adaptive(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(cancelText),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(true);
            onConfirm();
          },
          child: Text(confirmText, style: confirmTextStyle),
        ),
      ],
    ),
  );
}
