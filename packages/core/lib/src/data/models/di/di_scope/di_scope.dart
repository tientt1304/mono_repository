// Generated By XFlutter Cli.
//
// more info: https://xflutter-cli.com
import 'package:get_it/get_it.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'di_scope.freezed.dart';

@freezed
class DiScope with _$DiScope {
  const factory DiScope({
    /// name of scope.
    required String name,

    /// factory method to register dependencies of the scope.
    required GetIt Function() factory,

    /// drop scope on dispose.
    @Default(false) bool dispose,

    /// drop scope on lifeCycle-Owner dispose.
    @Default(true) bool disposeByOwner,

    /// instances that [DiScope] depends on, this dependencies will be registered before register this [DiScope].
    @Default([]) List<DiScope> dependencies,
  }) = _DiScope;
}
