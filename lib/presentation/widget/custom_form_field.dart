import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/constants/theme.dart';

Widget CustomTextFormField(
    {String? hint,
    String? label,
    TextInputType? type,
    TextStyle? style,
    TextEditingController? controller,
    String? Function(String?)? validator}) {
  return TextFormField(
    validator: validator,
    textAlign: TextAlign.left,
    cursorColor: Colors.black,
    decoration: InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(
        color: ThemeColor.darkGrey,
      ),
      labelText: label,
      fillColor: ThemeColor.lightGrey,
      filled: true,
      labelStyle: TextStyle(color: ThemeColor.darkGrey),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ThemeColor.darkGrey),
        borderRadius: BorderRadius.circular(10),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ThemeColor.lightGrey),
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    keyboardType: type,
  );
}
