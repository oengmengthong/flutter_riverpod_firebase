import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'src/shared/storage/storage.dart';
import 'package:get_it/get_it.dart';

import 'firebase_options.dart';
import 'src/app/app.dart';
import 'src/configs/server.dart';
import 'src/di/injection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<void> init(Server server) async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies(server);
  await _clearStorage();

  await Firebase.initializeApp(
    name: server.name,
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    ProviderScope(
      child: App(),
    ),
  );
}

/// Clears the authorization storage if the app has not run before.
/// Reads the [_hasRunBeforeStorageKey] from [storage] and if it is null or false,
/// clears the [authStorage] and writes true to [_hasRunBeforeStorageKey] in [storage].
const _hasRunBeforeStorageKey = 'has_run_before';
Future<void> _clearStorage() async {
  final allPurposedStorage = GetIt.I<Storage>(
    instanceName: 'storage',
  );
  final authzStorage = GetIt.I<Storage>(
    instanceName: 'authStorage',
  );

  final hasRunBefore = await allPurposedStorage.read<bool>(
    _hasRunBeforeStorageKey,
  );

  if (hasRunBefore == null || !hasRunBefore) {
    await authzStorage.clear();
    await allPurposedStorage.write(_hasRunBeforeStorageKey, true);
  }
}
