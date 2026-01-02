import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/home/home_bloc.dart';
import '../../blocs/home/home_state.dart';
import '../../widgets/text_form_field_widget.dart';

class DisplayNameSection extends StatelessWidget {
  final ThemeData theme;
  const DisplayNameSection({super.key,required this.theme});

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listenWhen: (prev, curr) => prev.displayName != curr.displayName,
      listener: (context, state) {
        // This ensures the TextField updates when we click "Randomize"
        // if (_controller.text != state.displayName) {
        //   _controller.text = state.displayName;
        // }
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: theme.colorScheme.primary.withValues(alpha: 0.2),
          border: Border.all(
            width: 0.2,
            color: theme.colorScheme.onPrimary.withValues(alpha: 0.5)
          ),
          borderRadius: BorderRadius.circular(16)
        ),
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              spacing: 5,
              children: [
                Icon(
                  Icons.account_circle,
                  color: theme.colorScheme.primary,
                ),
                Text(
                  'DISPLAY NAME',
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: theme.colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),

            Form(
              child: TextFormFieldWidget(
                // controller: controller.passwordController,
                hintText: 'e.g.Mystery Guest',
                textInputAction: TextInputAction.done,
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.casino,
                    size: 20,
                    color: theme.colorScheme.onPrimary.withValues(alpha: 0.4),
                  ),
                ),
                validator: (value) {
                  if(value == null) {
                    return "Display name can't be null or empty.";
                  } else {
                    return null;
                  }
                },
                onFieldSubmitted: (_) {},
              ),
            ),

            Text(
              "This is how you'll appear to other.",
              style: theme.textTheme.labelMedium?.copyWith(
                color: theme.colorScheme.onPrimary.withValues(alpha: 0.5),
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}