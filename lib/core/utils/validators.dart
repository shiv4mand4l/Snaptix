class AppValidators {
  // Full Name Validator
  static String? fullName(String? value) {
    final name = value?.trim() ?? '';

    if (name.isEmpty) {
      return 'Full name is required';
    }

    if (name.length < 3) {
      return 'Full name must be at least 3 characters';
    }

    if (!RegExp(r"^[a-zA-Z]+(?:[ '-][a-zA-Z]+)*$").hasMatch(name)) {
      return 'Please enter a valid full name';
    }

    return null;
  }

  // Email Validator
  static String? email(String? value) {
    final email = value?.trim() ?? '';

    if (email.isEmpty) {
      return 'Email is required';
    }

    if (!RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$').hasMatch(email)) {
      return 'Please enter a valid email';
    }

    return null;
  }

  // Password Validator
  static String? password(String? value) {
    final password = value ?? '';

    if (password.isEmpty) {
      return 'Password is required';
    }

    if (password.length < 8) {
      return 'Password must be at least 8 characters';
    }

    if (!RegExp(r'[A-Z]').hasMatch(password)) {
      return 'Password must contain an uppercase letter';
    }

    if (!RegExp(r'[a-z]').hasMatch(password)) {
      return 'Password must contain a lowercase letter';
    }

    if (!RegExp(r'[0-9]').hasMatch(password)) {
      return 'Password must contain a number';
    }

    return null;
  }

  // Confirm Password Validator
  static String? confirmPassword(String? value, String password) {
    final confirmPassword = value ?? '';

    if (confirmPassword.isEmpty) {
      return 'Please confirm your password';
    }

    if (confirmPassword != password) {
      return 'Passwords do not match';
    }

    return null;
  }
}
