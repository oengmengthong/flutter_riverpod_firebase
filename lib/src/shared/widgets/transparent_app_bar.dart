import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../extensions/context_exts.dart';

class TransparentAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TransparentAppBar._({
    this.title,
    this.centerTitle,
    this.leading,
    this.actions,
    this.textColor,
    this.systemOverlayStyle = SystemUiOverlayStyle.dark,
  });

  final Widget? title;
  final bool? centerTitle;
  final Widget? leading;
  final List<Widget>? actions;
  final SystemUiOverlayStyle systemOverlayStyle;
  final Color? textColor;

  factory TransparentAppBar.light({
    Widget? leading,
    bool? centerTitle,
    Widget? title,
    List<Widget>? actions,
  }) {
    return TransparentAppBar._(
      actions: actions,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      title: title,
      centerTitle: centerTitle,
      leading: leading,
      textColor: Colors.black,
    );
  }

  factory TransparentAppBar.dark({
    Widget? leading,
    Widget? title,
    bool? centerTitle,
    List<Widget>? actions,
  }) {
    return TransparentAppBar._(
      actions: actions,
      title: title,
      centerTitle: centerTitle,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      textColor: Colors.white,
    );
  }

  @override
  final Size preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final appBarTheme = context.theme.appBarTheme;

    return Theme(
      data: context.theme.copyWith(
        appBarTheme: appBarTheme.copyWith(
          backgroundColor: Colors.transparent,
          elevation: 0,
          systemOverlayStyle: systemOverlayStyle,
          titleTextStyle: appBarTheme.titleTextStyle?.copyWith(
            color: textColor,
          ),
          iconTheme: appBarTheme.iconTheme?.copyWith(
            color: textColor,
          ),
          actionsIconTheme: appBarTheme.actionsIconTheme?.copyWith(
            color: textColor,
          ),
        ),
      ),
      child: AppBar(
        leading: leading,
        title: title,
        centerTitle: centerTitle,
        actions: actions,
        systemOverlayStyle: systemOverlayStyle,
      ),
    );
  }
}
