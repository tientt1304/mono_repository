// Generated By XFlutter Cli.
//
// more info: https://xflutter-cli.com
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutterx_live_data/flutterx_live_data.dart';
import 'package:core/core.dart';
import 'common/router/app_router.dart';
import 'common/di/app_injectable.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  const environment = Environment(Environment.dev);
  await configureCoreDependencies(environment: environment);
  await configureAppDependencies(environment: environment);
  getIt<AppConnectivity>().initialize();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en')],
      path: 'assets/localization',
      fallbackLocale: const Locale('en'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    // back to previous screen
    eventBus.on<RouterBackEvent<dynamic>>().listen((event) {
      appRouter.maybePop(event.data);
    });

    // hide soft keyboard when (non-context class) emit event
    eventBus.on<SoftKeyboardEvent>().listen((_) {
      if (mounted) hideSoftKeyboard(context);
    });

    // handle unauthorizedEvent
    eventBus.on<UnauthorizedEvent>().listen((_) => handleUnauthorizedEvent());

    // set application UI configuration
    runAfterBuild(() => uiConfig(context));
  }

  /// logOut
  Future<void> handleUnauthorizedEvent() async {
    // TODO: handle Unauthorized Event
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => hideSoftKeyboard(context),
      child: LiveDataBuilder<ThemeMode>(
        data: getIt<ThemeNotifier>().themeMode,
        builder: (context, themeMode) => MaterialApp.router(
          routerDelegate: appRouter.delegate(),
          routeInformationParser: appRouter.defaultRouteParser(),
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: themeMode,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
        ),
      ),
    );
  }
}
