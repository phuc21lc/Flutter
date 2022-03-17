import 'package:flutter/material.dart';
import 'package:state_base/resources/strings.dart';
import 'package:state_base/resources/utils/common_functions.dart';
import 'package:state_base/resources/widgets/custom_button.dart';
import 'package:state_base/resources/widgets/information_card.dart';
import 'package:state_base/resources/widgets/label_widget.dart';
import 'package:state_base/resources/widgets/num_input_widget.dart';
import 'package:state_base/resources/widgets/text_input_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  //1. Hàm tạo ra state, gắn Context với state đó, context là linh hồn của widget
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String bill = "Chưa xác định";
  String adjustment = "Chưa xác định";
  bool isChecked = false;

  //2. mounted = true: Khi state đã có thì mounted = true
  TextEditingController? customerController, bookController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    customerController = TextEditingController();
    bookController = TextEditingController();
  }

  //4. didChangeDependencies
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  //5. Hàm build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(SALE),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(right: 20, left: 20),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: LabelWidget(
                      lb: CUSTOMER_NAME,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: TextInputWidget(controller: customerController),
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: LabelWidget(
                      lb: BOOK_AMOUNT,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: NumInputWidget(
                        isOnlyNumber: true, controller: bookController),
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: const SizedBox(
                    width: 1,
                  )),
                  Expanded(
                    flex: 0,
                    child: Center(
                      child: Checkbox(
                        checkColor: Colors.white,
                        activeColor: Colors.green,
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: LabelWidget(
                      lb: CUSTOMER_VIP,
                    ),
                    flex: 1,
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: LabelWidget(
                      lb: BILL,
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Container(
                        margin: const EdgeInsets.all(15),
                        padding: const EdgeInsets.all(10),
                        color: Colors.grey,
                        alignment: Alignment.center,
                        child: Text("$bill"),
                      ))
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: CustomButton(
                        onPressed: () {
                          bill =
                              getTotal(numBook: int.parse(bookController!.text))
                                  .toString();
                        },
                        title: SUM),
                  ),
                  Expanded(
                    flex: 1,
                    child: CustomButton(
                        onPressed: () {
                          print("testing");
                        },
                        title: NEXT),
                  ),
                  Expanded(
                    flex: 1,
                    child: CustomButton(
                        onPressed: () {
                          print("testing");
                        },
                        title: STATISTICAL),
                  )
                ],
              ),
              // Information
              InformationCard(
                cardTilte: STATISTICAL_INFO,
                firstLabel: CUSTOMER_TOTAL,
                firstContent: bill,
                secondLabel: VIP_TOTAL,
                secondContent: adjustment,
                thirdLabel: REVENUE,
                thirdContent: adjustment,
              ),
            ],
          ),
        ),
      ),
    );
  }

  //6. Chạy khi có Widget Configuration thay đổi
  @override
  void didUpdateWidget(covariant HomeScreen oldWidget) {
    // TODO: implement didUpdateWidget
  }

  //8. Hàm deactive : dừng hoạt động của State
  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }
//9. Hàm dispose : Xóa State đi khi chuyển sang Widget khác, tắt app
}
