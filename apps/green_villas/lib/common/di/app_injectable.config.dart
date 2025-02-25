// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:green_villas/home/viewmodels/home_viewmodel.dart' as _i258;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    return this;
  }

// initializes the registration of home-scope dependencies inside of GetIt
  _i174.GetIt initHomeScope({_i174.ScopeDisposeFunc? dispose}) {
    return _i526.GetItHelper(this).initScope(
      'home',
      dispose: dispose,
      init: (_i526.GetItHelper gh) {
        gh.lazySingleton<_i258.HomeViewModel>(() => _i258.HomeViewModel());
      },
    );
  }
}
