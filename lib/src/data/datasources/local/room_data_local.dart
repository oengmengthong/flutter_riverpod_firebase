import 'package:injectable/injectable.dart';
import '../../../shared/storage/storage.dart';

@injectable
class RoomDataLocal {
  RoomDataLocal({
    @Named('storage') required this.storage,
  });

  final Storage storage;

}