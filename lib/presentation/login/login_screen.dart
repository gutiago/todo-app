import 'package:flutter/material.dart';
import 'package:todo_app/resources/spacings.dart';

import '../../components/button.dart';
import '../../components/button_link.dart';
import '../../components/input_text.dart';
import '../../components/logo.dart';
import '../../model/login/login_screen_content.dart';
import '../../resources/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({this.onLoggedIn, this.content});

  final VoidCallback onLoggedIn;
  final LoginScreenContent content;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailInputController;
  TextEditingController _passwordInputController;

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
            ),
            const SizedBox(height: Spacings.x5),
            InputText(
              title: widget.content.passwordField.title,
              hintText: widget.content.passwordField.hint,
              icon: widget.content.passwordField.icon,
              controller: _passwordInputController,
            ),
            const SizedBox(height: Spacings.x10),
            Button(
              text: widget.content.buttonTitle,
              disabledColor: Colors.white.withOpacity(0.7),
              onPressed:
                  _formKey.currentState?.validate() ?? false ? () {} : null,
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
          onLinkPressed: () {
            print('pressed');
          },
        )),
      ),
    );
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
