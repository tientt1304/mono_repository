// Generated By XFlutter Cli.
//
// more info: https://xflutter-cli.com
import 'package:get_it/get_it.dart';

class DependencyLocator {
  /// create a global instance with [GetIt]
  static void putLazyInstance<T extends Object>(T Function() instance, {String? instanceName}) {
    /// avoid register more than one time.
    if (isRegistered<T>(instanceName: instanceName)) return;

    try {
      GetIt.I.registerLazySingleton<T>(() => instance(), instanceName: instanceName);
    } catch (_) {}
  }

  /// create a global instance with [GetIt] in async way
  static void putLazyInstanceAsync<T extends Object>(Future<T> Function() instance, {String? instanceName}) {
    /// avoid register more than one time.
    if (isRegistered<T>(instanceName: instanceName)) return;

    try {
      GetIt.I.registerLazySingletonAsync<T>(instance, instanceName: instanceName);
    } catch (_) {}
  }

  /// get the global instance from [GetIt]
  static T findInstance<T extends Object>({Type? type, String? instanceName}) {
    return GetIt.I.get<T>(instanceName: instanceName, type: type);
  }

  /// remove instance instance from [GetIt]
  static Future<void> destroyInstance<T extends Object>({T? instance, String? instanceName}) async {
    if (isRegistered<T>(instanceName: instanceName)) {
      await GetIt.I.unregister<T>(instance: instance, instanceName: instanceName);
    }
  }

  /// check if instance already registered with [GetIt]
  static bool isRegistered<T extends Object>({T? instance, String? instanceName}) {
    return GetIt.I.isRegistered<T>(instance: instance, instanceName: instanceName);
  }

  /// if instance isRegistered => return the Registered instance
  ///
  /// if instance is not registered => return `null`
  static T? findInstanceOrNull<T extends Object>({Type? type, String? instanceName}) {
    if (isRegistered<T>(instanceName: instanceName)) {
      return findInstance<T>(type: type, instanceName: instanceName);
    } else {
      return null;
    }
  }

  /// if instance isRegistered => return the Registered instance
  ///
  /// if instance is not registered => return [instance] with ability to register it
  static T tryFindInstance<T extends Object>(
    T instance, {
    bool register = false,
    Type? type,
    String? instanceName,
  }) {
    if (isRegistered<T>(instance: instance, instanceName: instanceName)) {
      return findInstance<T>(type: type, instanceName: instanceName);
    } else {
      // register instance
      if (register) putLazyInstance<T>(() => instance, instanceName: instanceName);

      return instance;
    }
  }
}
