import 'package:day_17/day_17.dart';
import 'package:test/test.dart';

void main() {
  test('part 1', () {
    expect(highestYFromShotInto('target area: x=20..30, y=-10..-5'), 45);
  });

  test('part 2', () {
    expect(
        differentAmountOfVelocities('target area: x=20..30, y=-10..-5'), 112);
  });
}
