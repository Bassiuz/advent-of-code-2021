import 'package:day_07/day_07.dart';
import 'package:test/test.dart';

void main() {
  test('part 1', () {
    var input = "16,1,2,0,4,2,7,1,2,14";
    expect(costOfFuelForAllToMedian(input), 37);
  });

  test('part 2', () {
    var input = "16,1,2,0,4,2,7,1,2,14";
    expect(costOfFuelForAllToAverage(input), 168);
  });

  test('test hypothesis', () {
    var input = "5, 100, 1800, 1900, 2000";

    expect(target(input), 1161);
    expect(costOfFuelForAllToAverage(input), 2062427);
  });
}
