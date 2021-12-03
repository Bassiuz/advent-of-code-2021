import 'package:day_03/day_03.dart';
import 'package:test/test.dart';

void main() {
  test('part-1', () {
    var list = [
      '00100',
      '11110',
      '10110',
      '10111',
      '10101',
      '01111',
      '00111',
      '11100',
      '10000',
      '11001',
      '00010',
      '01010'
    ];

    expect(findNumberWithCommonDenominatorInBit(list), 22);
    expect(findNumberWithUncommonDenominatorInBit(list), 9);

    expect(
        findNumberWithCommonDenominatorInBit(list) *
            findNumberWithUncommonDenominatorInBit(list),
        198);
  });

  test('part-2', () {
    var list = [
      '00100',
      '11110',
      '10110',
      '10111',
      '10101',
      '01111',
      '00111',
      '11100',
      '10000',
      '11001',
      '00010',
      '01010'
    ];

    expect(findNumberWithMostCommonDenominators(list), 23);
    expect(findNumberWithMostUncommonDenominators(list), 10);

    expect(
        findNumberWithMostCommonDenominators(list) *
            findNumberWithMostUncommonDenominators(list),
        230);
  });
}
