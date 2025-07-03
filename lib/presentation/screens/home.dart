import 'package:flutter/material.dart';
import 'package:the_grimoire/presentation/themes/colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColors.backgroundColor, body:Center(child: Text("Welcom to home page!",style: TextStyle(color: Colors.white,fontSize: 32,fontWeight: FontWeight.bold),)));
  }
}
