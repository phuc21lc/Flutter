import 'package:flutter/material.dart';
class TextAndTextWidget extends StatelessWidget {
  final String label;
  final String text;
  const TextAndTextWidget({Key? key, required this.label, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5, bottom: 5, right: 10, left: 10),
      child: Row(
        children: [
          Text(label, style: TextStyle(fontWeight: FontWeight.bold),),
          const SizedBox(width: 5,),
          Text(text)
        ],
      ),
    );
  }
}
