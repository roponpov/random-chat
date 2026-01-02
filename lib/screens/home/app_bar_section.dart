import 'package:flutter/material.dart';
import '../../core/constants/app_icon_constant.dart';

class AppBarSection extends StatelessWidget implements PreferredSizeWidget{
  final ThemeData theme;
  const AppBarSection({super.key, required this.theme});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: theme.scaffoldBackgroundColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 10,
        children: [
          Image.asset(
            AppIconConstant.chatIcon,
            height: 20,
            color: theme.colorScheme.primary,
          ),
          Text(
            'Random Chat',
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onPrimary,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
      shape: Border(
        bottom: BorderSide(
          width: 0.5,
          color: theme.colorScheme.onPrimary.withValues(alpha: 0.1),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}