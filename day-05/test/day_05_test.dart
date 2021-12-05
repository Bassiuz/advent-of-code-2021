import 'package:day_05/day_05.dart';
import 'package:test/test.dart';

void main() {
  test('part-1', () {
    var list = [
      '0,9 -> 5,9',
      '8,0 -> 0,8',
      '9,4 -> 3,4',
      '2,2 -> 2,1',
      '7,0 -> 7,4',
      '6,4 -> 2,0',
      '0,9 -> 2,9',
      '0,9 -> 2,9',
      '3,4 -> 1,4',
      '0,0 -> 8,8',
      '5,5 -> 8,2'
    ];

    var stopwatch = Stopwatch()..start();
    expect(findOverlappingPointsInLines(list), 5);
    print('findOverlappingPointsInLines() executed in ${stopwatch.elapsed}');
  });

  test('part-2', () {
    var list = [
      '0,9 -> 5,9',
      '8,0 -> 0,8',
      '9,4 -> 3,4',
      '2,2 -> 2,1',
      '7,0 -> 7,4',
      '6,4 -> 2,0',
      '0,9 -> 2,9',
      '0,9 -> 2,9',
      '3,4 -> 1,4',
      '0,0 -> 8,8',
      '5,5 -> 8,2'
    ];

    var stopwatch = Stopwatch()..start();
    expect(findOverlappingPointsInLinesAndDiagnoals(list), 12);
    print(
        'findOverlappingPointsInLinesAndDiagnoals() executed in ${stopwatch.elapsed}');
  });
}
