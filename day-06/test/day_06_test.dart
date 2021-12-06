import 'package:day_06/day_06.dart';
import 'package:test/test.dart';

void main() {
  test('part-1', () {
    var test_input = '3,4,3,1,2';

    expect(amountOfFish(test_input, 80), 5934);
  });
  test('part-2', () {
    var test_input = '3,4,3,1,2';

    expect(amountOfFish(test_input, 256), 26984457539);
  });
}
