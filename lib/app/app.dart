import 'package:flutter/material.dart';
import 'package:the_grimoire/app/routes.dart';

class GrimoireApp extends StatelessWidget {
  const GrimoireApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.register,
      routes: Routes().routes,
    );
  }
}
