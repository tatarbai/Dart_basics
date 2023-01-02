import 'dart:core';

Map<String, int> wordsCount(List<String> lst) {
  final retMap = <String, int>{};
  for (var word in lst) {
    if (retMap.containsKey(word)) {
      retMap.update(word, (value) => value + 1);
    } else {
      retMap[word] = 1;
    }
  }

  return retMap;
}

void main(List<String> arguments) {
  var ar = [
    "one",
    "two",
    "three",
    "four",
    "two",
    "three",
    "four",
    "three",
    "four",
    "four"
  ];
  print(wordsCount(ar));
}
