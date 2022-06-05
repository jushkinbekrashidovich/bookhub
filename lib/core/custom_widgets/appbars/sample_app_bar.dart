import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bookhubuz/core/theme/app_text_style.dart';

class SampleAppBar extends StatelessWidget with PreferredSizeWidget {
  final Widget? titleWidget;
  final String? title;
  final Widget? action;
  final Widget? leading;
  final double? elevation;

  const SampleAppBar({
    Key? key,
    this.titleWidget,
    this.title,
    this.action,
    this.leading,
    this.elevation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: titleWidget ??
          Text(
            title!,
            style: AppTextStyles.appBarTitle,
          ),
      centerTitle: true,
      leading: leading ?? const SizedBox.shrink(),
      elevation: elevation ?? 0,
      actions: [action ?? const SizedBox.shrink()],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
