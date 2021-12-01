import 'package:day_01/day_01.dart';
import 'package:test/test.dart';

void main() {
  test('countIncreases', () {
    var input = <int>[199, 200, 208, 210, 200, 207, 240, 269, 260, 263];
    expect(countIncreases(0, input), 7);
  });

  test('countIncreasesBasedOnXBaseValues', () {
    var input = <int>[199, 200, 208, 210, 200, 207, 240, 269, 260, 263];
    expect(countIncreasesBasedOnXBaseValues(0, input), 5);
  });
}
