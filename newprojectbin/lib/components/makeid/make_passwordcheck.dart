import 'package:flutter/material.dart';
import 'package:newprojectbin/utils/constants.dart';

class make_passwordcheck extends StatelessWidget {
  const make_passwordcheck({
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
            Icons.check,
            color: kPrimaryColor,
          ),
          hintText: "Password Check",
          border: InputBorder.none),
    );
  }
}