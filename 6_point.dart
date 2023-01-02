import 'dart:core';
import 'dart:math';

class Point {
  final double x;
  final double y;
  final double z;

  Point(this.x, this.y, this.z);

  factory Point.zero() {
    return Point(0, 0, 0);
  }

  factory Point.unitVector() {
    return Point(1, 1, 1);
  }

  num distanceTo(Point other) {
    return sqrt(
        pow((other.x - x), 2) + pow((other.y - y), 2) + pow((other.z - z), 2));
  }
}

void main(List<String> arguments) {
  final p1 = Point.unitVector();
  final p2 = Point.zero();

  print(p1.distanceTo(p2));
}
