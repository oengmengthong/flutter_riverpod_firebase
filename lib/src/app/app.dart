import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod_firebase/src/l10n/l10n.dart';
import 'package:flutter_riverpod_firebase/src/l10n/l10n_model.dart';
import 'package:flutter_riverpod_firebase/src/routers/app_router.dart';
import 'package:flutter_riverpod_firebase/src/shared/extensions/context_exts.dart';
import 'package:flutter_riverpod_firebase/src/shared/theme/app_theme.dart';
import 'package:flutter_riverpod_firebase/src/shared/theme/app_theme_data.dart';
import 'package:flutter_riverpod_firebase/src/shared/utils/clear_focus_navigator_observer.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppTheme(
      themeData: AppThemeData.system(context),
      child: Builder(
        builder: (context) {
          return MaterialApp.router(
            title: 'Riverpod Firebase',
            theme: context.appTheme.build(context),
            locale: ref.watch(l10nControllerProvider),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            routerConfig: GetIt.I<AppRouter>().config(
              navigatorObservers: () => [
                ClearFocusNavigatorObserver(),
              ],
            ),
            builder: (context, child) {
              return KeyboardDismisser(
                child: BotToastInit()(context, child),
              );
            },
          );
        },
      ),
    );
  }
}
