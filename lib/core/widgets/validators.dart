class AppValidators {
  static String? fullName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter full name';
    }

    if (value.trim().length < 3) {
      return 'Full name must be at least 3 characters';
    }

    return null;
  }

  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your email';
    }

    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (!emailRegex.hasMatch(value.trim())) {
      return 'Please enter a valid email';
    }

    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter your password';
    }

    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }

    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Password must contain a lowercase letter';
    }

    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password must contain an uppercase letter';
    }

    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Password must contain a number';
    }

    return null;
  }

  // Address Validator
  static String? address(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your address';
    }

    if (value.trim().length < 5) {
      return 'Address must be at least 5 characters';
    }

    return null;
  }

  // Phone Validator
  static String? phone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your phone number';
    }

    final phoneRegex = RegExp(r'^(010|011|012|015)[0-9]{8}$');

    if (!phoneRegex.hasMatch(value.trim())) {
      return 'Please enter a valid Egyptian phone number';
    }

    return null;
  }

  // Governorate Validator
  static String? governorate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select your governorate';
    }

    return null;
  }
}
