import 'package:flutter_riverpod_firebase/src/app/app.dart';
import 'package:flutter_riverpod_firebase/bootstrap.dart';
import 'package:flutter_riverpod_firebase/src/configs/server.dart';

import 'main.dart';

void main() {
  init(Server.development);
}
