import 'package:flutter/material.dart';
import 'package:state_base/resources/widgets/text_and_text_widget.dart';

class InformationCard extends StatelessWidget {
  final String cardTilte;
  final String firstLabel;
  final String firstContent;
  final String secondLabel;
  final String secondContent;
  final String thirdLabel;
  final String thirdContent;

  const InformationCard(
      {Key? key,
      required this.cardTilte,
      required this.firstLabel,
      required this.firstContent,
      required this.secondLabel,
      required this.secondContent,
      required this.thirdLabel,
      required this.thirdContent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, bottom: 10, left: 20, right: 20),
      child: Card(
        child: Column(
          children: [
            Text(
              cardTilte,
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
            ),
            const SizedBox(
              height: 10,
            ),
            TextAndTextWidget(label: firstLabel, text: firstContent),
            TextAndTextWidget(label: secondLabel, text: secondContent),
            TextAndTextWidget(label: thirdLabel, text: thirdContent),
          ],
        ),
      ),
    );
  }
}
