import 'package:day_10/day_10.dart';
import 'package:test/test.dart';

void main() {
  test('part-1', () {
    expect(countSyntaxErrorScore('{([(<{}[<>[]}>{[]{[(<()>'), 1197);
    expect(countSyntaxErrorScore('[{[{({}]{}}([{[{{{}}([]'), 57);
    expect(countSyntaxErrorScore('<{([([[(<>()){}]>(<<{{'), 25137);

    expect(countSyntaxErrorScore('[[<[([]))<([[{}[[()]]]'), 3);
  });

  test('part-2', () {
    expect(countUnfinishedLineScore('<{([{{}}[<[[[<>{}]]]>[]]'), 294);

    expect(countUnfinishedLineScore('{<[[]]>}<{[{[{[]{()[[[]'), 995444);
  });
}
