import 'package:flutter/material.dart';
import 'package:newprojectbin/utils/constants.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({
    Key? key,
    required this.tec,
  }) : super(key: key);

  final tec;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: true,
      controller: tec,
      decoration: InputDecoration(
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          hintText: "Password",
          border: InputBorder.none),
    );
  }
}