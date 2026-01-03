import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_bar_section.dart';
import 'bottom_navigation_bar_section.dart';
import 'card_section.dart';
import 'display_name_section.dart';
import 'info_stepper_section.dart';
import '../../blocs/home/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    return BlocProvider(
      create: (context) => HomeBloc(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: AppBarSection(theme: theme),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
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
        ),
        bottomNavigationBar: BottomNavigationBarSection(
          theme: theme,
          mediaQueryData: mediaQueryData,
          formKey: _formKey,
        ),
      ),
    );
  }
}
