import 'package:flutter/material.dart';
import 'package:the_grimoire/presentation/themes/colors.dart';

Widget authheader(String title, BuildContext context) {
  final size = MediaQuery.of(context).size;

  return Padding(
    padding: const EdgeInsets.only(top: 20,left: 5,bottom: 25),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // مهم عشان يمنع مشاكل الطول
      children: [
        Center(
          child: Image.asset(
          'images/1.png',
          width: size.width * 0.6,
          fit: BoxFit.cover,
        ),
        ),
        const SizedBox(height: 20),
        Align(
          alignment: Alignment.bottomLeft,
          child: Text(
          title,
          style: const TextStyle(
            color: AppColors.textColor,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        ),
      ],
    ),
  );
}
