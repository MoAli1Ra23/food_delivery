// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i7;
import 'package:food_delivery/features/food/data/repositories/food_repo_debug_impl.dart'
    as _i4;
import 'package:food_delivery/features/food/domain/repositories/food_repo.dart'
    as _i3;
import 'package:food_delivery/features/user_managment/data/auth/auth.dart'
    as _i6;
import 'package:food_delivery/features/user_managment/domain/repository/i_auth_facad.dart'
    as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

const String _debug = 'debug';
const String _prod = 'prod';

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.FoodRepo>(
      () => _i4.FoodRepoDebugImpl(),
      registerFor: {_debug},
    );
    gh.singleton<_i5.IAuthFacade>(
      _i6.Auth(gh<_i7.FirebaseAuth>()),
      registerFor: {_prod},
    );
    return this;
  }
}
