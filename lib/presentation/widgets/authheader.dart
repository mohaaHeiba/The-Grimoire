import 'package:flutter/material.dart';
import 'package:the_grimoire/app/themes/colors.dart';

Widget authheader(String title, BuildContext context) {
  return Padding(
    padding: EdgeInsetsGeometry.all(25),
    child: Column(
      children: [
        Image.asset(
          'images/1.png',
          width: MediaQuery.of(context).size.width * 0.6,
          height: MediaQuery.of(context).size.height * 0.2,
        ),
        const SizedBox(height: 10),
        Expanded(
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              '$title',
              style: TextStyle(
                color: AppColors.textColor,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
