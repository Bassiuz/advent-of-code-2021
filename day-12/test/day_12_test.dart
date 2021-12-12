import 'package:day_12/day_12.dart';
import 'package:test/test.dart';

void main() {
  test('part-1', () {
    List<String> input = [
      'start-A',
      'start-b',
      'A-c',
      'A-b',
      'b-d',
      'A-end',
      'b-end'
    ];
    expect(countTotalPossiblePaths(input), 10);
  });

  test('part-2', () {
    List<String> input = [
      'start-A',
      'start-b',
      'A-c',
      'A-b',
      'b-d',
      'A-end',
      'b-end'
    ];
    expect(countTotalPossiblePathsWhileTravelingSmallCavesTwice(input), 36);
  });
}
