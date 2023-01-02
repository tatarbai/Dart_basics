import 'dart:core';

List<num> getNumFromString(String line) {
  List<num> numbers = [];

  var numBuffer = "";

  for (var i = 0; i < line.length; ++i) {
    if (line[i].contains(new RegExp(r'[0-9]'))) {
      numBuffer += line[i];
      continue;
    }

    if (numBuffer.isNotEmpty) {
      numbers.add(num.parse(numBuffer));
      numBuffer = "";
    }
  }

  if (numBuffer.isNotEmpty) {
    numbers.add(num.parse(numBuffer));
    numBuffer = "";
  }

  return numbers;
}

void main(List<String> arguments) {
  print(getNumFromString("Hellio m21y baby 23 dsls54 f34os d2s2 18"));
}
