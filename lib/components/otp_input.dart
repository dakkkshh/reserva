import 'package:flutter/material.dart';
import 'package:reserva/components/text_field_container.dart';
import 'package:reserva/constants.dart';

class RoundedOTPField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedOTPField({
    Key? key,
    required this.hintText,
    required this.onChanged,
    this.icon = Icons.pin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
