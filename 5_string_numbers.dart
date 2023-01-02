import 'dart:core';

const numberMap = <String, num>{
  "zero": 0,
  "one": 1,
  "two": 2,
  "three": 3,
  "four": 4,
  "five": 5,
  "six": 6,
  "seven": 7,
  "eight": 8,
  "nine": 9,
};

/*
Как я понял, у нас может быть любой набор строк, в том числе и предложения c разными знаками препинания.
Могут не соблюдаться пробелы после знаков препинания.
Поэтому реализовал такой алгоритм нахождения слов в коллекции строк
*/

List<String> _listSplitter(List<String> lst, List<String> separators) {
  if (separators.isEmpty) {
    return lst;
  }

  List<String> retList = [];

  for (var line in lst) {
    retList += line.split(separators.first);
  }

  retList.removeWhere((item) => item == ""); // remove empty items after split

  separators.removeAt(0);
  return _listSplitter(retList, separators);
}

Set<num> findNumbers(List<String> stringList) {
  Set<num> numbers = {};

  var wordsList = _listSplitter(stringList, ["!", "?", ".", ",", ":", " "]);

  print(wordsList);
  print(wordsList.length);

  for (var word in wordsList) {
    if (numberMap.containsKey(word.toLowerCase())) {
      numbers.add(numberMap[word.toLowerCase()]!);
    }

    // no need to search more if we found all numbers
    if (numbers.length == 10) {
      return numbers;
    }
  }

  return numbers;
}

void main(List<String> arguments) {
  var ar = [
    "one, zero mal.Nine ppv, vod? And three! eight, five, six!Seven!!!",
    "two frintds come here, for gog, four",
    "Eight dollars werr, a vary Bad Things  six  "
  ];
  print(findNumbers(ar));
}
