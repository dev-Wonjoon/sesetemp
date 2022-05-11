import 'package:flutter/material.dart';
import 'package:newprojectbin/utils/constants.dart';

class make_password extends StatelessWidget {
  const make_password({
    Key? key,
    required this.tec,
  }) : super(key: key);

  final tec;

  @override
  Widget build(BuildContext context) {
    return TextField(
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