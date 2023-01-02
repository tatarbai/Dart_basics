import 'dart:core';

extension on num {
  // also add this method as public, may be usefull too :)
  num myPow(num degree) {
    num result = 1;
    bool negativeDegree = false;

    if (degree < 0) {
      negativeDegree = true;
      degree = degree.abs();
    }
    while (degree > 0) {
      result *= this;
      degree--;
    }
    return negativeDegree ? 1 / result : result;
  }

  void _rootNAvailable(num rootDegree) {
    if (rootDegree < 0) throw ArgumentError("Root degree must be more than 0");

    if (this < 0 && rootDegree % 2 == 0) {
      throw Exception("There is no root $rootDegree for $this");
    }
  }

  num _calcRootN(num rootDegree, num possibleValue, num lastPossibleValue) {
    if ((lastPossibleValue - possibleValue).abs() <= 0.00001) {
      return possibleValue;
    }

    num newK = (1 / rootDegree) *
        (((rootDegree - 1) * possibleValue) +
            (this / (possibleValue.myPow(rootDegree - 1))));
    return _calcRootN(rootDegree, newK, possibleValue);
  }

  num calculateRootN(num rootDegree) {
    try {
      _rootNAvailable(rootDegree);
    } on ArgumentError catch (e) {
      print(e);
      return 0.0 / 0.0; // the way to get NaN in result
    } on Exception catch (e) {
      print(e);
      return 0.0 / 0.0;
    } catch (e) {
      print("Othet exeption!");
      return 0.0 / 0.0;
    }

    if (rootDegree == 0) return 1;

    return _calcRootN(rootDegree, this / rootDegree, this);
  }
}

void main(List<String> arguments) {
  // good
  print((-2).calculateRootN(3));
  print((1024).calculateRootN(5));

  // exeptions
  print((-25).calculateRootN(2));
  print((25).calculateRootN(-1));
}
