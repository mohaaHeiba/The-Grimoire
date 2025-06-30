import 'package:flutter/material.dart';
import 'package:the_grimoire/presentation/themes/colors.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: AuthHeader('Register', context),
    );
  }
}

Widget AuthHeader(String title, BuildContext context) {
  return Padding(
    padding: EdgeInsetsGeometry.all(25),
    child: Column(
      children: [
        Image.asset(
          'images/1.png',
          width: MediaQuery.of(context).size.width * 0.6,
          height: MediaQuery.of(context).size.height * 0.2,
        ),
        const SizedBox(height: 20),
        Expanded(
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              '$title',
              style: TextStyle(
                color: AppColors.textColor,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
