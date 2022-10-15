import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final String labelText;
  final TextInputType textInputType;
  final Function(String) onChanged;
  final bool obscuredText;
  final Function(bool)? changeObscuredText;
  final Icon prefixIcon;
  final String? initialValue;

  const MyTextFormField(
      {Key? key,
      required this.onChanged,
      required this.textInputType,
      required this.labelText,
      required this.obscuredText,
      required this.changeObscuredText,
      required this.prefixIcon,
      required this.initialValue,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      keyboardType: textInputType,
      obscureText: obscuredText,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        prefixIcon: prefixIcon,
        labelText: labelText,
      ),
      textAlignVertical: TextAlignVertical.center,
      onChanged: (value) => onChanged(value),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Enter your email';
        }
        return null;
      },
    );
  }
}
