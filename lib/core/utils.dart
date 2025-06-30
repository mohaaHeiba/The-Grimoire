class Validators {
  static void validateEmail(String email) {
    final pattern = RegExp(r'^[\w\.-]+@gmail\.com$');
    if (!pattern.hasMatch(email)) {
      throw Exception("Email must be a valid Gmail address.");
    }
  }

  static void validatePassword(String password) {
    final hasNumber = RegExp(r'[0-9]');
    final hasSymbol = RegExp(r'[~!@#\$%^&*()_]');
    if (password.length < 8 ||
        !hasNumber.hasMatch(password) ||
        !hasSymbol.hasMatch(password)) {
      throw Exception(
        "Password must be at least 8 characters and include numbers and symbols.",
      );
    }
  }
}
