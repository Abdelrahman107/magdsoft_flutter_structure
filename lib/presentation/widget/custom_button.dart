import 'package:flutter/material.dart';

import 'package:magdsoft_flutter_structure/constants/theme.dart';

class CustomButtton extends StatelessWidget {
  String text;
  VoidCallback onPressed;
  Color color;

  CustomButtton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.2,
        height: MediaQuery.of(context).size.height * 0.05,
        alignment: Alignment.center,
        child: Text(
          text,
          style: const TextStyle(color: ThemeColor.blue),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
      ),
    );
  }
}
