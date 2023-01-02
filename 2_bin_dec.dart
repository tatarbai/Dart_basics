import 'dart:math';

int decToBinary(int val) {
  int result = 0;
  int order = 1;
  while (val > 0) {
    result += (val % 2) * order;
    order *= 10;
    val ~/= 2;
  }

  return result;
}

String decToBinaryString(int val) {
  String result = "";
  while (val > 0) {
    result = (val % 2).toString() + result;
    val ~/= 2;
  }

  return result;
}

int binaryToDec(int val) {
  return binaryStringToDec(val.toString());
}

int binaryStringToDec(String val) {
  var result = 0;
  var circleCount = 0;
  for (int i = val.length - 1; i >= 0; i--) {
    var digit = int.tryParse(val[i]) ?? -1;

    if (digit == 0 || digit == 1) {
      var ab = digit * pow(2, circleCount);
      result = result + (ab as int);
      ++circleCount;
    } else {
      print("Error: This is not a binary number");
      result = -1;
      break;
    }
  }

  return result;
}

void main(List<String> arguments) {
  print(binaryStringToDec('11110111'));
}
