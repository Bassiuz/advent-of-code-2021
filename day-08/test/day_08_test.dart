import 'dart:convert';
import 'dart:io';

import 'package:day_08/day_08.dart';
import 'package:test/test.dart';

void main() {
  test('part 2', () async {
    final file = File('bin/input-test.txt');
    var data = <String>[];
    var lines = file
        .openRead()
        .transform(utf8.decoder) // Decode bytes to UTF-8.
        .transform(LineSplitter()); // Convert stream to individual lines.
    try {
      await for (var line in lines) {
        data.add(line.replaceAll('  ', ' '));
      }
    } catch (e) {
      print('Error: $e');
    }
    expect(
        countValueOfDisplay(
            'be cfbegad cbdgef fgaecd cgeb fdcge agebfd fecdb fabcd edb | fdgacbe cefdb cefbgd gcbe'),
        8394);
    expect(
        countValueOfDisplay(
            'edbfga begcd cbg gc gcadebf fbgde acbgfd abcde gfcbed gfec | fcgedb cgb dgebacf gc'),
        9781);
    expect(
        countValueOfDisplay(
            'fgaebd cg bdaec gdafb agbcfd gdcbef bgcad gfac gcb cdgabef | cg cg fdcagb cbg'),
        1197);
    expect(
        countValueOfDisplay(
            'fbegcd cbd adcefb dageb afcb bc aefdc ecdab fgdeca fcdbega | efabcd cedba gadfec cb'),
        9361);
    expect(
        countValueOfDisplay(
            'aecbfdg fbg gf bafeg dbefa fcge gcbea fcaegb dgceab fcbdga | gecf egdcabf bgf bfgea'),
        4873);
    expect(
        countValueOfDisplay(
            'fgeab ca afcebg bdacfeg cfaedg gcfdb baec bfadeg bafgc acf | gebdcfa ecba ca fadegcb'),
        8418);
    expect(
        countValueOfDisplay(
            'dbcfg fgd bdegcaf fgec aegbdf ecdfab fbedc dacgb gdcebf gf | cefg dcbef fcge gbcadfe'),
        4548);
    expect(
        countValueOfDisplay(
            'bdfegc cbegaf gecbf dfcage bdacg ed bedf ced adcbefg gebcd | ed bcgafe cdgba cbgef'),
        1625);
    expect(
        countValueOfDisplay(
            'gcafb gcf dcaebfg ecagb gf abcdeg gaef cafbge fdbac fegbdc | fgae cfgab fg bagce'),
        4315);
    expect(countTotalOfDisplays(data), 61229);
  });
}
