import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/home/home_bloc.dart';
import '../../blocs/home/home_event.dart';
import '../../blocs/home/home_state.dart';
import '../../core/routes/app_routes.dart';

class BottomNavigationBarSection extends StatelessWidget {
  final ThemeData theme;
  final MediaQueryData mediaQueryData;
  final GlobalKey<FormState> formKey;

  const BottomNavigationBarSection({
    super.key,
    required this.theme,
    required this.mediaQueryData,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: mediaQueryData.viewInsets.bottom + 16,
        left: 16,
        right: 16,
        top: 16,
      ),
      child: BlocListener<HomeBloc,HomeState>(
        listener: (context, state) {
          if(state.navigateToChat) {
            Navigator.pushNamed(context, AppRoutes.chat);
          }
        },
        child: FilledButton(
          style: FilledButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
          onPressed: (){
            if (formKey.currentState!.validate()) {
              context.read<HomeBloc>().add(SubmitDisplayName());
            }
          },
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
      ),
    );
  }
}