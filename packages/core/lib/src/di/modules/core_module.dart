// Generated By XFlutter Cli.
//
// more info: https://xflutter-cli.com
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:core/src/utilities/network/http_interceptor.dart';
import 'package:core/src/environments/environments.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:injectable/injectable.dart';

@module
abstract class CoreModule {
  @lazySingleton
  Dio provideDio(AppEnvironment environment) {
    final dio = Dio()
      ..transformer = BackgroundTransformer()
      ..options = BaseOptions(
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        sendTimeout: const Duration(seconds: 60),
        baseUrl: environment.baseUrl,
      )
      ..interceptors.addAll([
        HttpInterceptor(),
      ]);

    if (kDebugMode) {
      final logger = PrettyDioLogger(
        request: true,
        compact: true,
        error: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
      );
      // add logger in debug mode
      dio.interceptors.add(logger);
    }

    return dio;
  }

  @test
  AppEnvironment get testEnvironment => TestEnvironment();

  @dev
  AppEnvironment get developmentEnvironment => DevelopmentEnvironment();

  @prod
  AppEnvironment get productionEnvironment => ProductionEnvironment();

  @preResolve
  @lazySingleton
  Future<SharedPreferences> provideSharedPreferences() =>
      SharedPreferences.getInstance();
}
