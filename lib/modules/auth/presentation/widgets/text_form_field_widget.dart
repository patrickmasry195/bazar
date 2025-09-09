import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    required this.hintText,
    this.keyboardType,
    this.suffixIcon,
    this.obscureText = false,
    this.enableSuggestions = true,
  });

  final String hintText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool enableSuggestions;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      maxLines: 1,
      obscureText: obscureText,
      enableSuggestions: enableSuggestions,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey[400]),
        filled: true,
        fillColor: Colors.grey[100],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
