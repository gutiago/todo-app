import 'strings.dart';

abstract class Validator {
  Validator._() : super();

  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return Strings.emailNotValid;
    }

    final isValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);

    if (isValid) {
      return null;
    }

    return Strings.emailNotValid;
  }

  static String? passwordValidator(String? password) {
    if (password == null || password.isEmpty) {
      return Strings.passwordInvalid;
    }

    final minLength = 8;
    final hasUppercase = password.contains(new RegExp(r'[A-Z]'));
    final hasLowercase = password.contains(new RegExp(r'[a-z]'));
    final hasMinLength = password.length > minLength;
    final isValid = hasUppercase & hasLowercase & hasMinLength;

    if (isValid) {
      return null;
    }

    return Strings.passwordInvalid;
  }
}
