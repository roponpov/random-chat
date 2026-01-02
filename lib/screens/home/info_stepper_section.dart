import 'package:flutter/material.dart';
import '../../core/extension/visibility_extension.dart';
import '../../models/stepper_model.dart';

class InfoStepperSection extends StatelessWidget {
  final ThemeData theme;
  final List<StepperModel> steppers = [
    StepperModel('Set your alias', 'Pick a display name. Your real identity remains hidden.', Icons.badge),
    StepperModel('Instant Match', 'Our system pairs you with a random person online.', Icons.bolt),
    StepperModel('End anytime', 'Leave the chat instantly if you feel uncomfortable.', Icons.block),
  ];
  InfoStepperSection({super.key, required this.theme});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: List.generate(steppers.length, (index) {
          final isLast = index == steppers.length - 1;
          final stepper = steppers[index];

          return IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: theme.colorScheme.primary.withValues(alpha: 0.2),
                        border: Border.all(
                          width: 0.5,
                          color: theme.colorScheme.onPrimary.withValues(alpha: 0.1),
                        )
                      ),
                      child: Icon(
                        stepper.icon,
                        color: theme.colorScheme.primary,
                        size: 20,
                      ),
                    ),
                    // Connecting Line
                    Expanded(
                      child: Container(
                        width: 3,
                        color: theme.colorScheme.primary.withValues(alpha: 0.2),
                      ).visibility(!isLast),
                    ),
                  ],
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        stepper.label,
                        style: theme.textTheme.titleSmall?.copyWith(
                          color: theme.colorScheme.onPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        stepper.subtitle,
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: theme.colorScheme.onPrimary.withValues(alpha: 0.8),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(height: 20).visibility(!isLast),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}