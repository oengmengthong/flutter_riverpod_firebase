import 'package:injectable/injectable.dart';
import 'package:synchronized/synchronized.dart';
import '../../../shared/storage/storage.dart';
import '../../../shared/utils/devices.dart';

final Lock deviceIdLock = Lock();

@injectable
class AuthDataLocal {
  AuthDataLocal({
    @Named('authStorage') required this.storage,
  });

  final Storage storage;
  final _deviceIdStorageKey = 'device_id';

  Future<String> getDeviceId() async {
    final String? value = await storage.read(_deviceIdStorageKey);

    /// If the [value] is null, generates a new device ID using the [Uuid().v4] method
    if (value == null) {
      return deviceIdLock.synchronized(() {
        final genDeviceId = Devices.generateDeviceId();
        storage.write(_deviceIdStorageKey, genDeviceId);
        return genDeviceId;
      });
    }

    return value;
  }

  Future<void> setDeviceId(String value) async {
    await storage.write(_deviceIdStorageKey, value);
  }
}