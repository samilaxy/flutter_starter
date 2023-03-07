import 'package:flutter/material.dart';

class ErrText extends StatelessWidget {
  const ErrText({
    super.key,
    required this.controller,
  });

  final controller;

  @override
  Widget build(BuildContext context) {
    return Text(
      controller.errMessage,
      textAlign: TextAlign.start,
      style: const TextStyle(
          fontSize: 12,
          color: Colors.red,
          fontWeight: FontWeight.normal),
    );
  }
}