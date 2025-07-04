import 'package:flutter/material.dart';

void showAppSnackBar({
  required BuildContext context,
  required String message,
  Color? backgroundColor,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message), backgroundColor: backgroundColor),
  );
}
