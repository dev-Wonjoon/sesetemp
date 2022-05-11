import 'package:flutter/material.dart';
import 'package:newprojectbin/utils/constants.dart';

class make_name extends StatelessWidget {
  const make_name({
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
            Icons.account_circle,
            color: kPrimaryColor,
          ),
          hintText: "Nickname",
          border: InputBorder.none),
    );
  }
}