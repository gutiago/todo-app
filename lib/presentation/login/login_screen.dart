import 'package:flutter/material.dart';
import 'package:todo_app/resources/spacings.dart';
import '../../components/button.dart';
import '../../components/button_link.dart';
import '../../components/input_text.dart';
import '../../components/logo.dart';
import '../../resources/app_colors.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
          child: Center(child: Logo(title: 'Sign In'))),
    );
  }

  Widget _mainContent() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: Spacings.x6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: Spacings.x5),
          InputText(
            title: 'Email',
            hintText: 'Insira seu email',
            icon: Icons.email_outlined,
          ),
          const SizedBox(height: Spacings.x5),
          InputText(
            title: 'Password',
            hintText: 'Insira sua senha',
            icon: Icons.lock_outlined,
          ),
          const SizedBox(height: Spacings.x10),
          Button(
            text: 'LOGIN',
            disabledColor: Colors.white.withOpacity(0.7),
            onPressed: () {},
          )
        ],
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
            text: 'Não tem uma conta? ',
            linkText: 'Cadastre-se aqui.',
            onLinkPressed: () {
              print('pressed');
            },
          )
        ),
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
