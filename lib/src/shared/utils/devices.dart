import 'package:uuid/uuid.dart';

class Devices {
  const Devices._();

  static String generateDeviceId() {
    return const Uuid().v4();
  }
}
