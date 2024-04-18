# Flutter Riverpod Firebase

---

## Getting Started 🚀

This project contains 3 flavors:

- development
- staging
- production

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Development
$ flutter run --flavor development --target lib/main_development.dart

# Staging
$ flutter run --flavor staging --target lib/main_staging.dart

# Production
$ flutter run --flavor production --target lib/main_production.dart
```

_\*Flutter Riverpod Firebase works on iOS, Android, Web, and Windows._

---

## Structure 🏗

The project is structured as follows:

```
├── lib
│   ├── src
│   │   ├── app
│   │   │   ├── app.dart
│   │   ├── configs
│   │   │   ├── server.dart
│   │   ├── data
│   │   │   ├── datasources
│   │   │   │   ├── remote
│   │   │   │   │   ├── auth_data_remote.dart
│   │   │   │   │   ├── user_data_remote.dart
│   │   │   │   ├── local
│   │   │   │   │   ├── auth_data_local.dart
│   │   │   │   │   ├── todo_data_local.dart
│   │   │   │   │   ├── user_data_local.dart
│   │   │   ├── entites
│   │   │   │   ├── todo.dart
│   │   │   ├── repositories
│   │   │   │   ├── auth_repository.dart
│   │   │   │   ├── auth_repository_impl.dart
│   │   ├── di
│   │   │   ├── modules
│   │   │   │   ├── auth_module.dart
│   │   │   │   ├── routes_module.dart
│   │   │   │   ├── storage_module.dart
│   │   │   ├── injection.config.dart
│   │   │   ├── injection.dart
│   │   ├── features
│   │   │   ├── auth
│   │   │   │   ├── view
│   │   │   │   │   ├── login_form.dart
│   │   │   │   │   ├── login_page.dart
│   │   │   │   ├── view_model
│   │   │   │   │   ├── auth_riverpod.dart
│   │   │   │   ├── auth.dart
│   │   │   ├── todo
│   │   │   │   ├── view
│   │   │   │   │   ├── todo_page.dart
│   │   │   │   ├── view_model
│   │   │   │   │   ├── todo_riverpod.dart
│   │   │   │   ├── todo.dart
│   │   │   ├── feature.dart
│   │   ├── l10n
│   │   │   ├── arb
│   │   │   │   ├── app_en.arb
│   │   │   │   ├── app_ja.arb
│   │   │   ├── l10n.dart
│   │   │   ├── l10n_model.dart
│   │   ├── routes
│   │   │   ├── app_router.dart
│   │   │   ├── guards.dart
│   │   ├── shared
│   │   │   ├── extensions
│   │   │   ├── listeners
│   │   │   ├── resources
│   │   │   ├── storage
│   │   │   ├── theme
│   │   │   ├── widgets
│   │   │   ├── utils
│   ├── firebase_options.dart
│   ├── main.dart
│   ├── main_development.dart
│   ├── main_staging.dart
│   └── main_production.dart
```

## Running Tests 🧪

To run all unit and widget tests use the following command:

```sh
$ flutter test --coverage --test-randomize-ordering-seed random
```

To view the generated coverage report you can use [lcov](https://github.com/linux-test-project/lcov).

```sh
# Generate Coverage Report
$ genhtml coverage/lcov.info -o coverage/

# Open Coverage Report
$ open coverage/index.html
```

---

## Working with Translations 🌐

This project relies on [flutter_localizations][flutter_localizations_link] and follows the [official internationalization guide for Flutter][internationalization_link].

### Adding Strings

1. To add a new localizable string, open the `app_en.arb` file at `lib/src/l10n/arb/app_en.arb`.

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    }
}
```

2. Then add a new key/value and description

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    },
    "helloWorld": "Hello World",
    "@helloWorld": {
        "description": "Hello World Text"
    }
}
```

3. Use the new string

```dart
import 'package:flutter_riverpod_firebase/l10n/src/l10n.dart';

@override
Widget build(BuildContext context) {
  final l10n = context.l10n;
  return Text(l10n.helloWorld);
}
```

### Adding Supported Locales

Update the `CFBundleLocalizations` array in the `Info.plist` at `ios/Runner/Info.plist` to include the new locale.

```xml
    ...

    <key>CFBundleLocalizations</key>
	<array>
		<string>en</string>
		<string>es</string>
	</array>

    ...
```

### Adding Translations

1. For each supported locale, add a new ARB file in `lib/src/l10n/arb`.

```
├── l10n
│   ├── arb
│   │   ├── app_en.arb
│   │   └── app_es.arb
```

2. Add the translated strings to each `.arb` file:

`app_en.arb`

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    }
}
```

`app_es.arb`

```arb
{
    "@@locale": "es",
    "counterAppBarTitle": "Contador",
    "@counterAppBarTitle": {
        "description": "Texto mostrado en la AppBar de la página del contador"
    }
}
```

### Generating Translations

To use the latest translations changes, you will need to generate them:

1. Generate localizations for the current project:

```sh
flutter gen-l10n --arb-dir="lib/src/l10n/arb"
```

Alternatively, run `flutter run` and code generation will take place automatically.

[coverage_badge]: coverage_badge.svg
[flutter_localizations_link]: https://api.flutter.dev/flutter/flutter_localizations/flutter_localizations-library.html
[internationalization_link]: https://flutter.dev/docs/development/accessibility-and-localization/internationalization
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[very_good_cli_link]: https://github.com/VeryGoodOpenSource/very_good_cli
