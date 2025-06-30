import 'package:the_grimoire/data/services/auth_service.dart';
import 'package:the_grimoire/domain/models/user_model.dart';
import 'package:the_grimoire/core/utils.dart';

class AuthController {
  final AuthService _authService = AuthService();

  Future<void> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    Validators.validateEmail(email);
    Validators.validatePassword(password);

    final user = UserModel(
      '', // uid will be set after registration
      firstName,
      lastName,
      email,
    );

    await _authService.registerUser(user, password);
  }

  Future<void> login({required String email, required String password}) async {
    Validators.validateEmail(email);
    Validators.validatePassword(password);

    await _authService.loginUser(email, password);
  }

  Future<void> logout() async {
    await _authService.logout();
  }

  bool isLoggedIn() => _authService.currentUser != null;
}
