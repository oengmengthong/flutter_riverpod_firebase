import 'package:injectable/injectable.dart';
import '../../../shared/storage/storage.dart';

@injectable
class UserDataLocal {
  UserDataLocal({
    @Named('authStorage') required this.storage,
  });

  final Storage storage;

}