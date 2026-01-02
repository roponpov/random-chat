import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final bool? obscureText;
  final TextInputAction? textInputAction;
  final Widget? suffixIcon;
  final Color? suffixIconColor;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;

  const TextFormFieldWidget({
    super.key,
    this.controller,
    required this.hintText,
    this.obscureText,
    this.textInputAction,
    this.validator,
    this.suffixIcon,
    this.suffixIconColor,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return TextFormField(
      obscureText: obscureText ?? false,
      controller: controller,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        hintText: hintText,
        isDense: true,
        hintStyle: theme.textTheme.labelLarge?.copyWith(
          color: theme.colorScheme.outline
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: theme.colorScheme.outline,
          ),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: theme.primaryColor, width: 1.5)),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: theme.colorScheme.error,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: theme.colorScheme.error, width: 1.5,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: suffixIcon,
        suffixIconColor: suffixIconColor,
      ),
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
