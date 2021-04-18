import 'package:flutter/material.dart';

import 'login_form_content.dart';
import '../../resources/strings.dart';
import '../../resources/validators.dart';

class LoginScreenContent {
  const LoginScreenContent({
    this.title,
    this.buttonTitle,
    this.footer,
    this.footerLink,
    this.isLoading = false,
    this.emailField,
    this.passwordField,
  });

  final String title;
  final String buttonTitle;
  final String footer;
  final String footerLink;
  final bool isLoading;
  final FormContent emailField;
  final FormContent passwordField;

  LoginScreenContent copyWith({
    String title,
    String buttonTitle,
    String noAccountText,
    String registerText,
    bool isLoading,
    FormContent emailField,
    FormContent passwordField,
  }) {
    return LoginScreenContent(
      title: title ?? this.title,
      buttonTitle: buttonTitle ?? this.buttonTitle,
      footer: noAccountText ?? this.footer,
      footerLink: registerText ?? this.footerLink,
      isLoading: isLoading ?? this.isLoading,
      emailField: emailField ?? this.emailField,
      passwordField: passwordField ?? this.passwordField,
    );
  }
}

extension LoginDefaultEmpty on LoginScreenContent {
  static get empty => LoginScreenContent(
        title: Strings.signIn,
        buttonTitle: Strings.loginButton,
        footer: Strings.noAccount,
        footerLink: Strings.registerHere,
        emailField: FormContent(
          title: Strings.emailTitle,
          hint: Strings.emailHint,
          icon: Icons.email_outlined,
          validator: Validator.emailValidator,
        ),
        passwordField: FormContent(
          title: Strings.emailTitle,
          hint: Strings.emailHint,
          icon: Icons.email_outlined,
          validator: Validator.passwordValidator,
        ),
      );
}
