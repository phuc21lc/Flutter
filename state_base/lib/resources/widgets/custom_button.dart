import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  final onPressed;
  final title;

  const CustomButton({Key? key, required this.onPressed, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.only(left: 5, right: 5),
        height: 30,
        color: Colors.grey,
        child: Center(
          child: Text(title),
        ),
      ),
    );
  }
}
