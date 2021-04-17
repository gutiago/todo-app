import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ButtonLink extends StatefulWidget {
  const ButtonLink({this.text, this.linkText, this.onLinkPressed});

  final String text;
  final String linkText;
  final VoidCallback onLinkPressed;

  @override
  _ButtonLinkState createState() => _ButtonLinkState();
}

class _ButtonLinkState extends State<ButtonLink> {
  TapGestureRecognizer gestureRecognizer;

  @override
  void initState() {
    super.initState();
    gestureRecognizer = TapGestureRecognizer()..onTap = widget.onLinkPressed;
  }

  @override
  void dispose() {
    super.dispose();
    gestureRecognizer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: 14.0,
          color: Colors.white,
        ),
        children: <TextSpan>[
          TextSpan(text: widget.text),
          TextSpan(
              text: widget.linkText,
              style: TextStyle(fontWeight: FontWeight.bold),
              recognizer: gestureRecognizer),
        ],
      ),
    );
  }
}
