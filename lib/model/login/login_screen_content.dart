import 'package:flutter/material.dart';

import 'login_form_content.dart';
import '../../resources/strings.dart';
import '../../resources/validators.dart';

enum LoginAction { login, register }

class LoginScreenContent {
  const LoginScreenContent({
    required this.title,
    required this.buttonTitle,
    required this.footer,
    required this.footerLink,
    required this.passwordHint,
    this.isLoading = false,
    required this.emailField,
    required this.passwordField,
    this.action = LoginAction.login,
  });

  final String title;
  final String buttonTitle;
  final String footer;
  final String footerLink;
  final String passwordHint;
  final bool isLoading;
  final FormContent emailField;
  final FormContent passwordField;
  final LoginAction action;

  LoginScreenContent copyWith({
    String? title,
    String? buttonTitle,
    String? footer,
    String? footerLink,
    String? passwordHint,
    bool? isLoading,
    FormContent? emailField,
    FormContent? passwordField,
    LoginAction? action,
  }) {
    return LoginScreenContent(
      title: title ?? this.title,
      buttonTitle: buttonTitle ?? this.buttonTitle,
      footer: footer ?? this.footer,
      footerLink: footerLink ?? this.footerLink,
      passwordHint: passwordHint ?? this.passwordHint,
      isLoading: isLoading ?? this.isLoading,
      emailField: emailField ?? this.emailField,
      passwordField: passwordField ?? this.passwordField,
      action: action ?? this.action,
    );
  }
}

extension LoginDefaultEmpty on LoginScreenContent {
  static get loginEmpty => LoginScreenContent(
        title: Strings.signIn,
        buttonTitle: Strings.loginButton,
        footer: Strings.noAccount,
        footerLink: Strings.registerHere,
        passwordHint: Strings.passwordContentHint,
        emailField: FormContent(
          title: Strings.emailTitle,
          hint: Strings.emailHint,
          icon: Icons.email_outlined,
          validator: Validator.emailValidator,
        ),
        passwordField: FormContent(
          title: Strings.passwordTitle,
          hint: Strings.passwordHint,
          icon: Icons.lock_outlined,
          validator: Validator.passwordValidator,
        ),
      );
}

extension RegisterDefaultEmpty on LoginScreenContent {
  static get registerEmpty => LoginScreenContent(
    title: Strings.createAccount,
    buttonTitle: Strings.registerButton,
    footer: Strings.hasAccount,
    footerLink: Strings.accessHere,
    passwordHint: Strings.passwordContentHint,
    action: LoginAction.register,
    emailField: FormContent(
      title: Strings.emailTitle,
      hint: Strings.emailRegisterHint,
      icon: Icons.email_outlined,
      validator: Validator.emailValidator,
    ),
    passwordField: FormContent(
      title: Strings.passwordTitle,
      hint: Strings.passwordRegisterHint,
      icon: Icons.lock_outlined,
      validator: Validator.passwordValidator,
    ),
  );
}
