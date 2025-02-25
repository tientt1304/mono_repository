// Generated By XFlutter Cli.
//
// more info: https://xflutter-cli.com
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutterx_live_data/flutterx_live_data.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'theme.dart';
import 'dark_theme.dart';
import 'package:core/src/events/event_bus.dart';
import 'package:core/src/extensions/di_extension.dart';

@lazySingleton
class ThemeNotifier {
  final _themeMode = MutableLiveData(value: ThemeMode.light);
  LiveData<ThemeMode> get themeMode => _themeMode;

  ThemeData get theme => themeMode.value == ThemeMode.dark ? darkTheme : lightTheme;

  SharedPreferences get _sharedPreferences => getIt<SharedPreferences>();

  ThemeNotifier() {
    initializeThemeMode();
  }

  /// check last saved [ThemeMode] from localStorage
  void initializeThemeMode() {
    final darkMode = _sharedPreferences.getBool('dark_theme');
    var themeMode = ThemeMode.light;
    if (darkMode == true) themeMode = ThemeMode.dark;
    if (darkMode == null) {
      // get device theme mode
      final brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
      if (brightness == Brightness.dark) themeMode = ThemeMode.dark;
    }
    if (themeMode != this.themeMode.value) {
      _themeMode.postValue(themeMode);
    }
  }

  /// change [ThemeMode]
  Future<void> changeThemeMode(ThemeMode mode) async {
    await _sharedPreferences.setBool('dark_theme', mode == ThemeMode.dark);
    _themeMode.postValue(mode);
    eventBus.fire(const ThemeChangedEvent());
  }

  /// Change [ThemeMode] depending on [themeMode] value
  ///
  /// change to [ThemeMode.dark] if [themeMode] == [ThemeMode.light]
  /// change to [ThemeMode.light] if [themeMode] == [ThemeMode.dark]
  Future<void> toggleThemeMode() async {
    final mode = themeMode.value == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    await changeThemeMode(mode);
  }
}
