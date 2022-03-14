import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController? mathController = TextEditingController();
  TextEditingController? litController = TextEditingController();
  TextEditingController? engController = TextEditingController();
  String avgMark = "Chưa xác định";
  String rate = "Chưa xác định";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tính điểm"),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            //TextField
            textInputWidget(
                labelText: "Điểm Toán",
                hintText: "Hãy nhập điểm Toán",
                controller: mathController),
            textInputWidget(
                labelText: "Điểm Văn",
                hintText: "Hãy nhập điểm Văn",
                controller: litController),
            textInputWidget(
                labelText: "Điểm Anh",
                hintText: "Hãy nhập điểm Anh",
                controller: engController),
            //Button
            ElevatedButton(
                onPressed: (){
                 setState(() {
                    avgMark = ((double.parse(mathController!.text) + double.parse(litController!.text) +double.parse(engController!.text))/3).toString();
                    if(double.parse(avgMark) < 5){
                      rate = "Học lực yếu";
                    } else if (double.parse(avgMark) < 6.5 && double.parse(avgMark) >= 5){
                      rate = "Học lực trung bình";
                    }else if (double.parse(avgMark) < 8 && double.parse(avgMark) >= 6.5){
                      rate = "Học lực khá";
                    }else if (double.parse(avgMark) >=8){
                      rate = "Học lực giỏi";
                    }
                 });
                },
                child: Text("Xác nhận")
            ),
            //Card
            infomationCard(
                cardTilte: "Thông tin",
                firstLabel: "Điểm trung bình: ",
                firstContent: avgMark,
                secondLabel: "Đánh giá: ",
                secondContent: rate)
            //Text Button
          ],
        ),
      ),
    );
  }

  Widget textInputWidget({required String labelText, required String hintText, required controller}) {
    return Container(
      padding: const EdgeInsets.only(top: 20, bottom: 10, left:  20 , right: 20),
        child: TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: labelText,
        hintText: hintText,
      ),
          controller: controller,
    ));
  }
  Widget infomationCard({required String cardTilte,
    required String firstLabel, required String firstContent,
    required String secondLabel, required String secondContent}){
    return Container(
      padding: const EdgeInsets.only(top: 20, bottom: 10, left:  20 , right: 20),
      child: Card(
        child: Column(
          children: [

            Text(
              cardTilte,
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
              ),
            textAndTextWidget(label: firstLabel, text: firstContent),
            textAndTextWidget(label: secondLabel, text: secondContent),
          ],
        ),
      ),
    );
  }
  Widget textAndTextWidget({required String label, required String text}){
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
