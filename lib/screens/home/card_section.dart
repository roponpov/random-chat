import 'package:flutter/material.dart';
import '../../core/constants/app_icon_constant.dart';
import '../../core/constants/app_image_constant.dart';

class CardSection extends StatelessWidget {
  final ThemeData theme;
  const CardSection({super.key, required this.theme});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: theme.colorScheme.primary.withValues(alpha: 0.4),
        ),
        image: const DecorationImage(
          image: AssetImage(
            AppImageConstant.cardBackground
          ),
          fit: BoxFit.cover,
          opacity: 0.5,
        )
      ),
      child: Column(
        spacing: 12,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 5,
            ),
            decoration: BoxDecoration(
              color: theme.scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: theme.colorScheme.onPrimary.withValues(alpha: 0.5),
              ),
            ),
            child: Row(
              spacing: 5,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  AppIconConstant.secureIcon,
                  height: 12,
                ),
                Text(
                  'ANONYMOUS & SAFE',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Text(
            'Chat with \nStrangers',
            style: theme.textTheme.headlineSmall?.copyWith(
              color: theme.colorScheme.onPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Connect instantly. No sign-up required. Just pick a name and start.',
            style: theme.textTheme.labelMedium?.copyWith(
              color: theme.colorScheme.onPrimary.withValues(alpha: 0.8),
              fontWeight: FontWeight.normal,
            ),
          )
        ],
      ),
    );
  }
}