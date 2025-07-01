import 'package:flutter/material.dart';
import 'package:the_grimoire/app/themes/colors.dart';
import 'package:the_grimoire/presentation/widgets/authheader.dart';

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
      body: authheader('Register', context),
    );
  }
}
