import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/home/home_bloc.dart';
import '../../blocs/home/home_event.dart';
import '../../blocs/home/home_state.dart';
import '../../widgets/text_form_field_widget.dart';

class DisplayNameSection extends StatefulWidget {
  final ThemeData theme;
  const DisplayNameSection({super.key,required this.theme});

  @override
  State<DisplayNameSection> createState() => _DisplayNameSectionState();
}

class _DisplayNameSectionState extends State<DisplayNameSection> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: widget.theme.colorScheme.primary.withValues(alpha: 0.2),
        border: Border.all(
          width: 0.2,
          color: widget.theme.colorScheme.onPrimary.withValues(alpha: 0.5)
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
                color: widget.theme.colorScheme.primary,
              ),
              Text(
                'DISPLAY NAME',
                style: widget.theme.textTheme.labelLarge?.copyWith(
                  color: widget.theme.colorScheme.onPrimary,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),

          BlocListener<HomeBloc,HomeState>(
            listenWhen: (previous, current) => previous.displayName != current.displayName,
            listener: (context, state) {
              _controller.text = state.displayName;
            },
            child: TextFormFieldWidget(
              controller: _controller,
              hintText: 'e.g.Mystery Guest',
              textInputAction: TextInputAction.done,
              suffixIcon: IconButton(
                onPressed: () => context.read<HomeBloc>().add(GenerateRandomName()),
                icon: Icon(
                  Icons.casino,
                  size: 20,
                  color: widget.theme.colorScheme.onPrimary.withValues(alpha: 0.4),
                ),
              ),
              onChanged: (value) {
                context.read<HomeBloc>().add(NameChanged(value));
              },
              validator: (value) {
                if(value?.isEmpty ?? true) {
                  return "Display name can't be null or empty.";
                } else {
                  return null;
                }
              },
            ),
          ),

          Text(
            "This is how you'll appear to other.",
            style: widget.theme.textTheme.labelMedium?.copyWith(
              color: widget.theme.colorScheme.onPrimary.withValues(alpha: 0.5),
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}