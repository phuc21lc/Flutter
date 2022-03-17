
double getAvgMark({ required double mathMark, required double litMark, required double engMark}){
  return (mathMark + litMark + engMark)/3;
}

String adjustStudent({required double avgMark}){
  if(avgMark<5){
    return "Chưa đạt";
  } else if (avgMark < 8.5){
    return "Đạt";
  } else if (avgMark < 10){
    return "Xuất sắc";
  } else if (avgMark < 0 || avgMark > 10){
    return "Điểm không hợp lệ";
  }
  return "Điểm không hợp lệ";
}

double getTotal({required int numBook}){
  return numBook * 20000;
}

double getDiscount({required int numBook}){
  int a = numBook * 20000;
  return a - a*10/100;
}