import 'package:flutter/material.dart';
import 'package:todo_app/resources/spacings.dart';

import '../../components/button.dart';
import '../../components/button_link.dart';
import '../../components/input_text.dart';
import '../../components/logo.dart';
import '../../model/login/login_screen_content.dart';
import '../../resources/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    required this.onLogInPressed,
    required this.onChangeTypePressed,
    required this.content,
  });

  final Function onLogInPressed;
  final Function onChangeTypePressed;
  final LoginScreenContent content;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _emailInputController;
  late TextEditingController _passwordInputController;

  @override
  void initState() {
    super.initState();
    _emailInputController = TextEditingController();
    _passwordInputController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailInputController.dispose();
    _passwordInputController.dispose();
  }

  Widget _backgroundGradient() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: FractionalOffset.bottomCenter,
          colors: AppColors.gradientSet,
        ),
      ),
    );
  }

  Widget _logo(BuildContext context) {
    return Positioned(
      top: Spacings.x20,
      child: Container(
          width: MediaQuery.of(context).size.width,
          child: Center(child: Logo(title: widget.content.title))),
    );
  }

  Widget _mainContent() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: Spacings.x6),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: Spacings.x5),
            InputText(
              title: widget.content.emailField.title,
              hintText: widget.content.emailField.hint,
              icon: widget.content.emailField.icon,
              controller: _emailInputController,
              validator: widget.content.emailField.validator,
            ),
            const SizedBox(height: Spacings.x5),
            InputText(
              title: widget.content.passwordField.title,
              hintText: widget.content.passwordField.hint,
              icon: widget.content.passwordField.icon,
              controller: _passwordInputController,
              validator: widget.content.passwordField.validator,
              obscureText: true,
            ),
            const SizedBox(height: Spacings.x5),
            Text(
              widget.content.passwordHint,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.white.withOpacity(0.3),
              ),
            ),
            const SizedBox(height: Spacings.x10),
            Button(
              isLoading: widget.content.isLoading,
              text: widget.content.buttonTitle,
              disabledColor: Colors.white.withOpacity(0.7),
              onPressed: widget.content.isLoading ? null : _buttonPressed,
            )
          ],
        ),
      ),
    );
  }

  Widget _bottom(BuildContext context) {
    return Positioned(
      bottom: Spacings.x8,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Center(
            child: ButtonLink(
          text: widget.content.footer,
          linkText: widget.content.footerLink,
          onLinkPressed: () => widget.onChangeTypePressed(widget.content),
        )),
      ),
    );
  }

  void _buttonPressed() {
    if (_formKey.currentState?.validate() ?? false) {
      widget.onLogInPressed(
        _emailInputController.text.trim(),
        _passwordInputController.text.trim(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          _backgroundGradient(),
          _mainContent(),
          _logo(context),
          _bottom(context),
        ],
      ),
    );
  }
}
