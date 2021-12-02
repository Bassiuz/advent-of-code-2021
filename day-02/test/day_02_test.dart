import 'package:day_02/day_02.dart';
import 'package:test/test.dart';

void main() {
  test('multiplyHorizontalAndVerticalPoisitionOfCommands', () {
    var input = <String>[
      'forward 5',
      'down 5',
      'forward 8',
      'up 3',
      'down 8',
      'forward 2'
    ];

    expect(multiplyHorizontalAndVerticalPoisitionOfCommands(input), 150);
  });

  test('getLocationResultWithAim', () {
    var input = <String>[
      'forward 5',
      'down 5',
      'forward 8',
      'up 3',
      'down 8',
      'forward 2'
    ];

    expect(getLocationResultWithAim(input), 900);
  });
}
