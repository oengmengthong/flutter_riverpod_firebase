import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../configs/server.dart';
import 'injection.config.dart';

const development = Environment('development');
const staging = Environment('staging');
const production = Environment('production');

@InjectableInit(
  preferRelativeImports: true,
  throwOnMissingDependencies: true,
)
Future<void> configureDependencies(Server server) async {
  await GetIt.instance.init(environment: server.name);
}
