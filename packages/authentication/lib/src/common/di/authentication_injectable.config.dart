// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:authentication/src/authentication/data/data_sources/remote/authentication/authentication_remote_data_source.dart'
    as _i692;
import 'package:authentication/src/authentication/data/repositories/authentication/authentication_repository.dart'
    as _i528;
import 'package:authentication/src/authentication/data/repositories/authentication/authentication_repository_impl.dart'
    as _i831;
import 'package:authentication/src/authentication/presentation/screens/login/viewmodels/login_viewmodel.dart'
    as _i742;
import 'package:authentication/src/authentication/presentation/screens/verify_pin_code/viewmodels/verify_pin_code_viewmodel.dart'
    as _i576;
import 'package:authentication/src/common/mediators/controllers/authentication_controller.dart'
    as _i394;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i394.AuthenticationController>(
        () => _i394.AuthenticationController());
    return this;
  }

// initializes the registration of authentication-scope dependencies inside of GetIt
  _i174.GetIt initAuthenticationScope({_i174.ScopeDisposeFunc? dispose}) {
    return _i526.GetItHelper(this).initScope(
      'authentication',
      dispose: dispose,
      init: (_i526.GetItHelper gh) {
        gh.lazySingleton<_i692.AuthenticationRemoteDataSource>(
            () => _i692.AuthenticationRemoteDataSource(gh<_i361.Dio>()));
        gh.lazySingleton<_i528.AuthenticationRepository>(() =>
            _i831.AuthenticationRepositoryImpl(
                gh<_i692.AuthenticationRemoteDataSource>()));
      },
    );
  }

// initializes the registration of verifyPinCode-scope dependencies inside of GetIt
  _i174.GetIt initVerifyPinCodeScope({_i174.ScopeDisposeFunc? dispose}) {
    return _i526.GetItHelper(this).initScope(
      'verifyPinCode',
      dispose: dispose,
      init: (_i526.GetItHelper gh) {
        gh.lazySingleton<_i576.VerifyPinCodeViewModel>(() =>
            _i576.VerifyPinCodeViewModel(gh<_i528.AuthenticationRepository>()));
      },
    );
  }

// initializes the registration of login-scope dependencies inside of GetIt
  _i174.GetIt initLoginScope({_i174.ScopeDisposeFunc? dispose}) {
    return _i526.GetItHelper(this).initScope(
      'login',
      dispose: dispose,
      init: (_i526.GetItHelper gh) {
        gh.lazySingleton<_i742.LoginViewModel>(
            () => _i742.LoginViewModel(gh<_i528.AuthenticationRepository>()));
      },
    );
  }
}
