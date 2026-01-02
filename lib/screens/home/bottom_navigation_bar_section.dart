import 'package:flutter/material.dart';

class BottomNavigationBarSection extends StatelessWidget {
  final ThemeData theme;
  final MediaQueryData mediaQueryData;
  const BottomNavigationBarSection({super.key, required this.theme, required this.mediaQueryData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: mediaQueryData.viewInsets.bottom + 16,
        left: 16,
        right: 16,
        top: 16,
      ),
      child: FilledButton(
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
        onPressed: (){},
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            spacing: 5,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Start Chatting',
                style: theme.textTheme.labelLarge?.copyWith(
                  color: theme.colorScheme.onPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(
                Icons.arrow_forward_outlined,
                color: theme.colorScheme.onPrimary,
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}