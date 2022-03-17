import 'package:flutter/material.dart';

class NumInputWidget extends StatelessWidget {
  final bool isOnlyNumber;
  final controller;

  const NumInputWidget({
    Key? key,
    required this.isOnlyNumber,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding:
            const EdgeInsets.only(top: 20, bottom: 10, left: 20, right: 20),
        child: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
          keyboardType:
              isOnlyNumber ? TextInputType.number : TextInputType.text,
          controller: controller,
        ));
  }
}
