import 'package:flutter/material.dart';

class AuthFormFields extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController? firstNameController;
  final TextEditingController? lastNameController;
  final bool showNameFields;

  const AuthFormFields({
    required this.emailController,
    required this.passwordController,
    this.firstNameController,
    this.lastNameController,
    this.showNameFields = false,
    super.key,
  });

  final _inputDecoration = const InputDecoration(
    labelStyle: TextStyle(color: Colors.white),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
    filled: true,
    fillColor: Colors.black87,
  );

  Widget _buildNameFields() {
    if (!showNameFields ||
        firstNameController == null ||
        lastNameController == null) {
      return const SizedBox.shrink();
    }

    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: firstNameController,
            decoration: _inputDecoration.copyWith(labelText: 'First Name'),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: TextField(
            controller: lastNameController,
            decoration: _inputDecoration.copyWith(labelText: 'Last Name'),
          ),
        ),
      ],
    );
  }

  Widget _buildEmailField() {
    return TextField(
      controller: emailController,
      decoration: _inputDecoration.copyWith(labelText: 'Email'),
    );
  }

  Widget _buildPasswordField() {
    return TextField(
      controller: passwordController,
      obscureText: true,
      decoration: _inputDecoration.copyWith(labelText: 'Password'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (showNameFields) _buildNameFields(),
        if (showNameFields) const SizedBox(height: 16),
        _buildEmailField(),
        const SizedBox(height: 16),
        _buildPasswordField(),
      ],
    );
  }
}
