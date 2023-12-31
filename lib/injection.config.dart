// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:food_delivery/features/food/data/repositories/food_repo_debug_impl.dart'
    as _i5;
import 'package:food_delivery/features/food/domain/repositories/food_repo.dart'
    as _i4;
import 'package:food_delivery/features/restraunt_management/data/repositories/restraunt_repo_firebae_implementation.dart'
    as _i9;
import 'package:food_delivery/features/restraunt_management/domain/repositoies/restraunt_repo.dart'
    as _i8;
import 'package:food_delivery/features/user_managment/data/auth/auth.dart'
    as _i7;
import 'package:food_delivery/features/user_managment/domain/repository/i_auth_facad.dart'
    as _i6;
import 'package:food_delivery/shared/abstracts/app_model.dart' as _i10;
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
    final appModel = _$AppModel();
    gh.factory<_i3.FirebaseAuth>(() => appModel.auth);
    gh.factory<_i4.FoodRepo>(
      () => _i5.FoodRepoDebugImpl(),
      registerFor: {_debug},
    );
    gh.singleton<_i6.IAuthFacade>(
      _i7.Auth(),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i8.RestrauntRepo>(
        () => _i9.RestrauntRepoFirebaseImplementation());
    return this;
  }
}

class _$AppModel extends _i10.AppModel {}
