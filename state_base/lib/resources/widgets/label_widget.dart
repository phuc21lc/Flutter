
import 'package:flutter/material.dart';
class LabelWidget extends StatelessWidget {
  final String? lb;
  const LabelWidget({Key? key, required this.lb}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("$lb",style: const TextStyle(fontWeight: FontWeight.bold),);
  }
}
