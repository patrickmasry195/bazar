import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class PhoneNumberInputField extends StatelessWidget {
  const PhoneNumberInputField({
    super.key,
    this.controller,
    this.onInputChanged,
    this.hintText,
  });

  final TextEditingController? controller;
  final Function(PhoneNumber)? onInputChanged;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      onChanged: onInputChanged,
      controller: controller,
      initialCountryCode: 'EG',
      decoration: InputDecoration(
        hintText: hintText ?? '123 435 7565',
        hintStyle: TextStyle(color: Colors.grey.shade600),
        filled: true,
        fillColor: Colors.grey.shade100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
