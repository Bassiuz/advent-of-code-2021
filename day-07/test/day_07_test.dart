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
}
