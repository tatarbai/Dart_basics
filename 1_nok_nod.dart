// Проверка чисел на значения меньше единицы
bool _checkValues(int a, int b) {
  if (a < 1 || b < 1) {
    print("Error: Can't count values less 1");
    return false;
  }

  return true;
}

// Получаю наименьший делитель без остатка
int _getCleanDivisionDivider(int value) {
  if (value == 1) return 1;
  int divider = 2;
  while (divider <= value) {
    if (value % divider == 0) break;
    ++divider;
  }
  return divider;
}

// Список простых множителей
List<int> _getSimpleDividersList(int value) {
  List<int> simpleMultiplierList = [];
  while (value != 1) {
    int multiplierValue = _getCleanDivisionDivider(value);
    simpleMultiplierList.add(multiplierValue);
    value = value ~/ multiplierValue;
  }
  return simpleMultiplierList;
}

int findNOD(int a, int b) {
  if (!_checkValues(a, b)) return -1;

  List<int> aList = _getSimpleDividersList(a);
  List<int> bList = _getSimpleDividersList(b);

  int nod = 1;
  for (var val in aList) {
    if (bList.contains(val)) {
      nod *= val;
      bList.remove(val);
    }
  }

  return nod;
}

int findNOK(int a, int b) {
  if (!_checkValues(a, b)) return -1;

  return a * b ~/ findNOD(a, b);
}

void main(List<String> arguments) {
  print(findNOD(25, 1));
  print(findNOK(25, 120));
}
