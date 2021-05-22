import 'package:devcredit/components/text_field_container.dart';
import 'package:flutter/material.dart';
import 'package:devcredit/contains.dart';

class RoundedInputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final Function onTap;
  final FocusNode focusNode;
  final TextInputType keyboardType;
  const RoundedInputField({
    Key key,
    this.controller,
    this.hintText,
    this.keyboardType,
    this.onTap,
    this.focusNode,
    this.icon = Icons.person,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        onChanged: onChanged,
        onTap: onTap,
        focusNode: focusNode,
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
