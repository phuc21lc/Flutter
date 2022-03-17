import 'package:flutter/material.dart';

class TextInputWidget extends StatelessWidget {

  final controller;

  const TextInputWidget({
    Key? key,
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
          controller: controller,
        ));
  }
}
