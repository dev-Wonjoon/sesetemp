import 'package:flutter/material.dart';
import 'package:newprojectbin/utils/constants.dart';

class make_id extends StatelessWidget {
  const make_id({
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
            Icons.mail,
            color: kPrimaryColor,
          ),
          hintText: "Id",
          border: InputBorder.none),
    );
  }
}