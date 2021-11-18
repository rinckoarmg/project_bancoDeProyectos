import 'package:flutter/material.dart';

class ValidatorForm extends StatelessWidget {
  const ValidatorForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  bool isValidEmail(String text) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(text);
  }

  bool isValidName(String text) {
    return RegExp(r"^[a-zA-ZñÑ ]+$").hasMatch(text);
  }
}
