import 'strings.dart';

abstract class Validator {
  Validator._() : super();

  static String emailValidator(String value) {
    final isValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);

    if (isValid) {
      return null;
    }

    return Strings.emailNotValid;
  }

  static String passwordValidator(String password) {
    if (password == null || password.isEmpty) {
      return _passwordCustomMessage();
    }

    final minLength = 8;
    final hasUppercase = password.contains(new RegExp(r'[A-Z]'));
    final hasDigits = password.contains(new RegExp(r'[0-9]'));
    final hasLowercase = password.contains(new RegExp(r'[a-z]'));
    final hasSpecialCharacters =
        password.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    final hasMinLength = password.length > minLength;
    final isValid = hasDigits &
        hasUppercase &
        hasLowercase &
        hasSpecialCharacters &
        hasMinLength;

    if (isValid) {
      return null;
    }

    return _passwordCustomMessage(
      hasUppercase: hasUppercase,
      hasDigits: hasDigits,
      hasLowercase: hasLowercase,
      hasSpecialCharacters: hasSpecialCharacters,
      hasMinLength: hasMinLength,
    );
  }

  static String _passwordCustomMessage({
    bool hasUppercase = false,
    bool hasDigits = false,
    bool hasLowercase = false,
    bool hasSpecialCharacters = false,
    bool hasMinLength = false,
  }) {
    String message = Strings.emailNotValid;

    if (hasUppercase) {
      message += Strings.passwordNotValidHint1;
    }

    if (hasDigits) {
      message += Strings.passwordNotValidHint2;
    }

    if (hasLowercase) {
      message += Strings.passwordNotValidHint3;
    }

    if (hasSpecialCharacters) {
      message += Strings.passwordNotValidHint4;
    }

    if (hasMinLength) {
      message += Strings.passwordNotValidHint5;
    }

    return message;
  }
}
