import 'package:flutter/material.dart';

import 'login_form_content.dart';
import '../../resources/strings.dart';
import '../../resources/validators.dart';

class LoginScreenContent {
  const LoginScreenContent({
    this.title,
    this.buttonTitle,
    this.noAccountText,
    this.registerText,
    this.isLoading = false,
    this.formFields,
  });

  final String title;
  final String buttonTitle;
  final String noAccountText;
  final String registerText;
  final bool isLoading;
  final List<FormContent> formFields;

  LoginScreenContent copyWith({
    String title,
    String buttonTitle,
    String noAccountText,
    String registerText,
    bool isLoading,
    List<FormContent> formFields,
  }) {
    return LoginScreenContent(
      title: title ?? this.title,
      buttonTitle: buttonTitle ?? this.buttonTitle,
      noAccountText: noAccountText ?? this.noAccountText,
      registerText: registerText ?? this.registerText,
      isLoading: isLoading ?? this.isLoading,
      formFields: formFields ?? this.formFields,
    );
  }
}

extension LoginDefaultEmpty on LoginScreenContent {
  static get empty => LoginScreenContent(
        title: Strings.signIn,
        buttonTitle: Strings.loginButton,
        noAccountText: Strings.noAccount,
        registerText: Strings.registerHere,
        formFields: [
          FormContent(
            title: Strings.emailTitle,
            hint: Strings.emailHint,
            icon: Icons.email_outlined,
            validator: Validator.emailValidator,
          ),
          FormContent(
            title: Strings.emailTitle,
            hint: Strings.emailHint,
            icon: Icons.email_outlined,
            validator: Validator.passwordValidator,
          ),
        ],
      );
}
