import 'package:flutter/material.dart';
import 'package:the_grimoire/presentation/screens/auth/register_screen.dart';
import 'package:the_grimoire/presentation/themes/colors.dart';
import 'package:the_grimoire/presentation/widgets/authformfield.dart';
import 'package:the_grimoire/presentation/widgets/authheader.dart';
import 'package:the_grimoire/data/services/auth_service.dart';
import 'package:the_grimoire/domain/controllers/auth_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>{
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  @override
 

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColors.backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(       // physics: const BouncingScrollPhysics(),
           child:Padding(padding: const EdgeInsets.all(24),             
               child: Column(
                  children: [
                    SizedBox(
                      width: size.width                      ,
                      height: 250,
                      child: authheader("Login",context)
                    ),      
                              AuthFormFields(
                                emailController: _emailController,
                                passwordController: _passwordController,
                                showNameFields: false,
                              ),
                              const SizedBox(height: 24),
                              SizedBox(
                                height: 48,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color.fromARGB(
                                      255,
                                      38,
                                      8,
                                      82,
                                    ),
                                    foregroundColor: AppColors.textColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    textStyle: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onPressed: () {
                                    // Handle Login
                                  },
                                  child: const Text('Login'),
                                ),
                              ),
                              TextButton(
                                onPressed: (){
                                 Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => const RegisterScreen()));
                                },
                                child: const Text('Don\'t have an account? Register'),
                              ),
                            ],
                          ),
                        ),
            ),),),
    );
  }
}
