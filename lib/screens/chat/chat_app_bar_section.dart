import 'package:flutter/material.dart';

class ChatAppBarSection extends StatelessWidget implements PreferredSizeWidget{
  final ThemeData theme;
  const ChatAppBarSection({super.key, required this.theme});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Icon(
        Icons.arrow_back_outlined,
        color: theme.colorScheme.onPrimary,
      ),
      backgroundColor: theme.scaffoldBackgroundColor,
      title: Text(
        'Random Chat',
        style: theme.textTheme.bodyLarge?.copyWith(
          color: theme.colorScheme.onPrimary,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        FilledButton(
          style: FilledButton.styleFrom(
              backgroundColor: theme.colorScheme.primary.withValues(alpha: 0.1)
          ),
          onPressed: () { },
          child: Row(
            spacing: 5,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Next',
                style: theme.textTheme.labelLarge?.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
              Icon(
                Icons.skip_next_rounded,
                size: 20,
                color: theme.colorScheme.primary,
              ),
            ],
          ),
        )
      ],
      centerTitle: true,
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