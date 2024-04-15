// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:ui' as _i14;

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:cloud_firestore/cloud_firestore.dart' as _i12;
import 'package:firebase_auth/firebase_auth.dart' as _i7;
import 'package:firebase_storage/firebase_storage.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i15;

import '../data/datasources/local/auth_data_local.dart' as _i16;
import '../data/datasources/local/room_data_local.dart' as _i13;
import '../data/datasources/local/user_data_local.dart' as _i17;
import '../data/datasources/remote/auth_data_remote.dart' as _i11;
import '../data/datasources/remote/file_data_remote.dart' as _i9;
import '../data/datasources/remote/room_data_remote.dart' as _i19;
import '../data/datasources/remote/user_data_remote.dart' as _i10;
import '../data/repositories/auth_repository.dart' as _i20;
import '../data/repositories/auth_repository_impl.dart' as _i21;
import '../data/repositories/user_repository.dart' as _i22;
import '../data/repositories/user_repository_impl.dart' as _i23;
import '../feature/auth/cubit/auth_cubit.dart' as _i24;
import '../l10n/l10n_cubit.dart' as _i18;
import '../routers/app_router.dart' as _i8;
import '../routers/guards.dart' as _i4;
import '../shared/storage/storage.dart' as _i6;
import 'module/app_module.dart' as _i27;
import 'module/routes_module.dart' as _i26;
import 'module/storage_module.dart' as _i25;

const String _staging = 'staging';
const String _production = 'production';
const String _development = 'development';

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final storageModule = _$StorageModule();
    final routesModule = _$RoutesModule();
    final appModule = _$AppModule();
    gh.factory<String>(() => storageModule.storagePrefixKey);
    gh.factory<List<_i3.AutoRoute>>(() => routesModule.routes);
    gh.singleton<_i4.RoleGuard>(() => routesModule.roleGuard);
    gh.factory<_i5.FirebaseStorage>(
      () => appModule.firebaseStorage,
      instanceName: 'firebaseStorage',
    );
    gh.singleton<_i6.Storage>(
      () => storageModule.allPurposedStorage,
      instanceName: 'storage',
    );
    gh.factory<_i7.FirebaseAuth>(
      () => appModule.firebaseAuth,
      instanceName: 'firebaseAuth',
    );
    gh.singleton<_i8.AppRouter>(() => routesModule.appRouter(
          gh<_i4.RoleGuard>(),
          gh<List<_i3.AutoRoute>>(),
        ));
    gh.factory<_i9.FileDataRemote>(() => _i9.FileDataRemote(
        storage: gh<_i5.FirebaseStorage>(instanceName: 'firebaseStorage')));
    gh.factory<_i10.UserDataRemote>(() => _i10.UserDataRemote(
        auth: gh<_i7.FirebaseAuth>(instanceName: 'firebaseAuth')));
    gh.factory<_i11.AuthDataRemote>(() => _i11.AuthDataRemote(
        auth: gh<_i7.FirebaseAuth>(instanceName: 'firebaseAuth')));
    gh.factory<_i12.FirebaseFirestore>(
      () => appModule.firestore,
      instanceName: 'firebaseFirestore',
    );
    await gh.factoryAsync<String>(
      () => appModule.stagingAppVersion,
      instanceName: 'appVersion',
      registerFor: {_staging},
      preResolve: true,
    );
    gh.singleton<_i6.Storage>(
      () => storageModule.authzStorage,
      instanceName: 'authStorage',
    );
    gh.factory<_i13.RoomDataLocal>(() =>
        _i13.RoomDataLocal(storage: gh<_i6.Storage>(instanceName: 'storage')));
    gh.factory<_i14.Locale>(
      () => appModule.defaultLocale,
      instanceName: 'defaultLocale',
    );
    gh.factory<_i15.LogPrinter>(
      () => appModule.prodLogPrinter,
      registerFor: {_production},
    );
    gh.factory<_i15.LogPrinter>(
      () => appModule.devLogPrinter,
      registerFor: {
        _development,
        _staging,
      },
    );
    await gh.factoryAsync<String>(
      () => appModule.developmentAppVersion,
      instanceName: 'appVersion',
      registerFor: {_development},
      preResolve: true,
    );
    await gh.factoryAsync<String>(
      () => appModule.prodAppVersion,
      instanceName: 'appVersion',
      registerFor: {_production},
      preResolve: true,
    );
    gh.factory<_i16.AuthDataLocal>(() => _i16.AuthDataLocal(
        storage: gh<_i6.Storage>(instanceName: 'authStorage')));
    gh.factory<_i17.UserDataLocal>(() => _i17.UserDataLocal(
        storage: gh<_i6.Storage>(instanceName: 'authStorage')));
    gh.factory<_i18.L10nCubit>(() => _i18.L10nCubit(
          defaultLocale: gh<_i14.Locale>(instanceName: 'defaultLocale'),
          storage: gh<_i6.Storage>(instanceName: 'storage'),
        ));
    gh.factory<_i19.RoomDataRemote>(() => _i19.RoomDataRemote(
        firestore:
            gh<_i12.FirebaseFirestore>(instanceName: 'firebaseFirestore')));
    gh.factory<_i20.AuthRepository>(() => _i21.AuthRepositoryImpl(
          local: gh<_i16.AuthDataLocal>(),
          remote: gh<_i11.AuthDataRemote>(),
        ));
    gh.factory<_i22.UserRepository>(() => _i23.UserRepositoryImpl(
          local: gh<_i17.UserDataLocal>(),
          remote: gh<_i10.UserDataRemote>(),
        ));
    gh.factory<_i24.AuthCubit>(() => _i24.AuthCubit(
          gh<_i20.AuthRepository>(),
          gh<_i22.UserRepository>(),
        ));
    return this;
  }
}

class _$StorageModule extends _i25.StorageModule {}

class _$RoutesModule extends _i26.RoutesModule {}

class _$AppModule extends _i27.AppModule {}
