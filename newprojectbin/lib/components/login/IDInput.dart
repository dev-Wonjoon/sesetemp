import 'package:flutter/material.dart';
import 'package:newprojectbin/utils/constants.dart';

class IDInput extends StatelessWidget {
  const IDInput({
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
          hintText: "ID",
          border: InputBorder.none),
    );
  }
}