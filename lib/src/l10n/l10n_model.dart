import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'dart:ui';
import '../shared/storage/storage.dart';
import 'package:get_it/get_it.dart';

final l10nControllerProvider =
    StateNotifierProvider<L10nController, Locale>((ref) {
  return GetIt.I<L10nController>();
});

@injectable
class L10nController extends StateNotifier<Locale> {
  static const _languageCodeStorageKey = 'language_code';
  static const _countryCodeStorageKey = 'country_code';

  L10nController({
    @Named('defaultLocale') required this.defaultLocale,
    @Named('storage') required this.storage,
  }) : super(defaultLocale) {
    _initialize();
  }

  final Locale defaultLocale;
  final Storage storage;

  Future<void> _initialize() async {
    try {
      final locale = await Future.wait([
        storage.read(_languageCodeStorageKey),
        storage.read(_countryCodeStorageKey),
      ]).then((values) {
        return values[0] != null ? Locale(values[0], values[1]) : null;
      });
      state = locale ?? defaultLocale;
    } catch (e) {
      state = defaultLocale;
    }
  }

  Future<void> setLocale(Locale locale) async {
    state = locale;
    await Future.wait([
      storage.write(_languageCodeStorageKey, locale.languageCode),
      storage.write(_countryCodeStorageKey, locale.countryCode)
    ]);
  }
}
