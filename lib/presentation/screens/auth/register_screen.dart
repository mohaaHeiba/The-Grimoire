import 'package:flutter/material.dart';
import 'package:the_grimoire/presentation/screens/auth/login_screen.dart';
import 'package:the_grimoire/presentation/screens/home.dart';
import 'package:the_grimoire/presentation/themes/colors.dart';
import 'package:the_grimoire/presentation/widgets/authformfield.dart';
import 'package:the_grimoire/presentation/widgets/authheader.dart';
import 'package:the_grimoire/domain/controllers/auth_controller.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final AuthController _authController = AuthController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _register() async {
    final firstName = _firstNameController.text.trim();
    final lastName = _lastNameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (firstName.isEmpty ||
        lastName.isEmpty ||
        email.isEmpty ||
        password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields'),backgroundColor: AppColors.alert,),
      );
      return;
    }

    try {
      await _authController.register(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
      );
        ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Registration successful'),backgroundColor: AppColors.success,));
     Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => const Home()));
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Registration failed: $e'),backgroundColor: AppColors.alert,));
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
    resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          
          child:
              
              Padding(
                
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                width: size.width,
                height: 250,
               child: authheader( 'Login', context),
              ),
                    AuthFormFields(
                      emailController: _emailController,
                      passwordController: _passwordController,
                      firstNameController: _firstNameController,
                      lastNameController: _lastNameController,
                      showNameFields: true,
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 38, 8, 82),
                          foregroundColor: AppColors.textColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          textStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: _register,
                        child: const Text('Register'),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => const LoginScreen()));
                      },
                      child: const Text('Do you have an account? Login'),
                    ),
                  ],
                ),
              
            
          ),
        ),
      ),
    );
  }
}
