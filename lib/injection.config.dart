// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i7;
import 'package:connectivity_plus/connectivity_plus.dart' as _i5;
import 'package:firebase_auth/firebase_auth.dart' as _i6;
import 'package:firebase_storage/firebase_storage.dart' as _i8;
import 'package:food_delivery/features/cart/data/repsitories/cart_item_repo.impl.dart'
    as _i4;
import 'package:food_delivery/features/cart/data/repsitories/order_repo_impl.dart'
    as _i22;
import 'package:food_delivery/features/cart/domain/repositories/cart_item_repo.dart'
    as _i3;
import 'package:food_delivery/features/cart/domain/repositories/order_repo.dart'
    as _i21;
import 'package:food_delivery/features/food/data/repositories/food_repo_debug_impl.dart'
    as _i10;
import 'package:food_delivery/features/food/domain/repositories/food_repo.dart'
    as _i9;
import 'package:food_delivery/features/image_management/data/repositories/image_date_cash.dart'
    as _i16;
import 'package:food_delivery/features/image_management/data/repositories/image_repo_impl.dart'
    as _i18;
import 'package:food_delivery/features/image_management/domain/repositories/image_data_cashed_repo.dart'
    as _i15;
import 'package:food_delivery/features/image_management/domain/repositories/image_repo.dart'
    as _i17;
import 'package:food_delivery/features/menu/data/repositories/menu_item_repo_impl.dart'
    as _i20;
import 'package:food_delivery/features/menu/doamain/repositories/menu_items_repo.dart'
    as _i19;
import 'package:food_delivery/features/restraunt_management/data/repositories/restraunt_repo_firebae_implementation.dart'
    as _i24;
import 'package:food_delivery/features/restraunt_management/domain/repositoies/restraunt_repo.dart'
    as _i23;
import 'package:food_delivery/features/user_managment/data/auth/auth.dart'
    as _i12;
import 'package:food_delivery/features/user_managment/data/auth/profile_management.dart'
    as _i14;
import 'package:food_delivery/features/user_managment/domain/repository/i_auth_facad.dart'
    as _i11;
import 'package:food_delivery/features/user_managment/domain/repository/i_prof_managemant.dart'
    as _i13;
import 'package:food_delivery/shared/abstracts/app_model.dart' as _i25;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

const String _prod = 'prod';
const String _debug = 'debug';

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
    final connections = _$Connections();
    final appModel = _$AppModel();
    final man = _$Man();
    final storage = _$Storage();
    gh.lazySingleton<_i3.CartItemRepo>(
      () => _i4.CartItemRepoImpl(),
      registerFor: {
        _prod,
        _debug,
      },
    );
    gh.factory<_i5.Connectivity>(
      () => connections.connection,
      registerFor: {
        _prod,
        _debug,
      },
    );
    gh.factory<_i6.FirebaseAuth>(
      () => appModel.auth,
      registerFor: {
        _prod,
        _debug,
      },
    );
    gh.factory<_i7.FirebaseFirestore>(
      () => man.firestore,
      registerFor: {
        _prod,
        _debug,
      },
    );
    gh.factory<_i8.FirebaseStorage>(
      () => storage.storage,
      registerFor: {
        _prod,
        _debug,
      },
    );
    gh.factory<_i9.FoodRepo>(
      () => _i10.FoodRepoDebugImpl(),
      registerFor: {_debug},
    );
    gh.singleton<_i11.IAuthFacade>(
      _i12.Auth(),
      registerFor: {
        _prod,
        _debug,
      },
    );
    gh.singleton<_i13.IProfManagement>(
      _i14.ProfileManagement(),
      registerFor: {
        _prod,
        _debug,
      },
    );
    gh.lazySingleton<_i15.ImageDataCasheRepo>(
      () => _i16.ImageDataCasheRepoImpl(),
      registerFor: {
        _prod,
        _debug,
      },
    );
    gh.lazySingleton<_i17.ImageRepo>(
      () => _i18.ImageRepoImpl(),
      registerFor: {
        _prod,
        _debug,
      },
    );
    gh.lazySingleton<_i19.MenuitemsRepo>(
      () => _i20.MenuItemRepoImpl(),
      registerFor: {
        _prod,
        _debug,
      },
    );
    gh.lazySingleton<_i21.OrderRepo>(
      () => _i22.OrderRepoImpl(),
      registerFor: {
        _prod,
        _debug,
      },
    );
    gh.lazySingleton<_i23.RestrauntRepo>(
      () => _i24.RestrauntRepoFirebaseImplementation(),
      registerFor: {
        _prod,
        _debug,
      },
    );
    return this;
  }
}

class _$Connections extends _i25.Connections {}

class _$AppModel extends _i25.AppModel {}

class _$Man extends _i25.Man {}

class _$Storage extends _i25.Storage {}
