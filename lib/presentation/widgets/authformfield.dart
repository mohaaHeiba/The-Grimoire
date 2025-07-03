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

  static const _inputDecoration = InputDecoration(
    labelStyle: TextStyle(color: Colors.white),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
    filled: true,
    fillColor: Colors.black87,
  );

  Widget _buildNameFields() {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: firstNameController,
            decoration: _inputDecoration.copyWith(labelText: 'First Name'),
            textInputAction: TextInputAction.next,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: TextFormField(
            controller: lastNameController,
            decoration: _inputDecoration.copyWith(labelText: 'Last Name'),
            textInputAction: TextInputAction.next,
          ),
        ),
      ],
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      controller: emailController,
      decoration: _inputDecoration.copyWith(labelText: 'Email'),
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      controller: passwordController,
      obscureText: true,
      decoration: _inputDecoration.copyWith(labelText: 'Password'),
      textInputAction: TextInputAction.done,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (showNameFields &&
            firstNameController != null &&
            lastNameController != null)
          ...[
            _buildNameFields(),
            const SizedBox(height: 16),
          ],
        _buildEmailField(),
        const SizedBox(height: 16),
        _buildPasswordField(),
      ],
    );
  }
}
