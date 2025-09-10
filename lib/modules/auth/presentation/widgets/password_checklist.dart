import 'package:flutter/material.dart';

import 'package:bazar/core/theme/app_color/app_color_light.dart';
import 'package:bazar/core/validators/password_validator.dart';

class PasswordChecklist extends StatelessWidget {
  final PasswordValidator password;

  const PasswordChecklist({super.key, required this.password});

  Widget _buildItem(bool condition, String text) {
    return Row(
      children: [
        Icon(
          condition ? Icons.check : Icons.close,
          color: condition ? Color(0xffA28CE0) : Colors.red,
          size: 18,
        ),
        const SizedBox(width: 6),
        Text(
          text,
          style: TextStyle(
            color: condition ? Color(0xffA28CE0) : AppColorLight.hintTextColor,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildItem(password.hasMinLength, "Minimum 8 characters"),
        _buildItem(password.hasNumber, "At least 1 number (0-9)"),
        _buildItem(password.hasLetter, "At least 1 letter (a-z / A-Z)"),
      ],
    );
  }
}
