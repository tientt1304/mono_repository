// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [LoginScreen]
class Login extends PageRouteInfo<void> {
  const Login({List<PageRouteInfo>? children})
      : super(
          Login.name,
          initialChildren: children,
        );

  static const String name = 'Login';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoginScreen();
    },
  );
}

/// generated route for
/// [VerifyPinCodeScreen]
class VerifyPinCode extends PageRouteInfo<VerifyPinCodeArgs> {
  VerifyPinCode({
    required String phone,
    required dynamic Function(dynamic) onVerifySuccess,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          VerifyPinCode.name,
          args: VerifyPinCodeArgs(
            phone: phone,
            onVerifySuccess: onVerifySuccess,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'VerifyPinCode';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<VerifyPinCodeArgs>();
      return VerifyPinCodeScreen(
        phone: args.phone,
        onVerifySuccess: args.onVerifySuccess,
        key: args.key,
      );
    },
  );
}

class VerifyPinCodeArgs {
  const VerifyPinCodeArgs({
    required this.phone,
    required this.onVerifySuccess,
    this.key,
  });

  final String phone;

  final dynamic Function(dynamic) onVerifySuccess;

  final Key? key;

  @override
  String toString() {
    return 'VerifyPinCodeArgs{phone: $phone, onVerifySuccess: $onVerifySuccess, key: $key}';
  }
}
