import 'package:flutter/material.dart';
import 'package:flutter_riverpod_firebase/src/l10n/l10n.dart';
import 'package:flutter_riverpod_firebase/src/shared/theme/app_theme.dart';
import 'package:flutter_riverpod_firebase/src/shared/theme/app_theme_data.dart';

extension ThemeExts on BuildContext {
  ThemeData get theme => Theme.of(this);
  AppThemeData get appTheme => AppTheme.of(this);
  TextTheme get textTheme => theme.textTheme;
}

extension MediaQueryExts on BuildContext {
  EdgeInsets get viewPadding => MediaQuery.of(this).viewPadding;
  Size get screenSize => MediaQuery.of(this).size;
}

extension StringExtensions on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}

extension KeyboardExts on BuildContext {
  void hideKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
