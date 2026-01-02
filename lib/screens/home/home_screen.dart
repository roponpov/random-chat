import 'package:flutter/material.dart';
import 'app_bar_section.dart';
import 'bottom_navigation_bar_section.dart';
import 'card_section.dart';
import 'display_name_section.dart';
import 'info_stepper_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBarSection(theme: theme),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CardSection(theme: theme),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  'How it works',
                  style: theme.textTheme.titleSmall?.copyWith(
                    color: theme.colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              InfoStepperSection(theme: theme),
              DisplayNameSection(theme: theme),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBarSection(
        theme: theme,
        mediaQueryData: mediaQueryData,
      ),
    );
  }
}
