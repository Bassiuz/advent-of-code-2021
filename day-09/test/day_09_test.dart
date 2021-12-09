import 'dart:convert';
import 'dart:io';

import 'package:day_09/day_09.dart';
import 'package:test/test.dart';

void main() {
  test('part-1', () async {
    final file = File('bin/input-test.txt');
    List<List<int>> data = [];
    var lines = file
        .openRead()
        .transform(utf8.decoder) // Decode bytes to UTF-8.
        .transform(LineSplitter()); // Convert stream to individual lines.
    try {
      await for (var line in lines) {
        var lineList = line.split('');
        data.add(lineList.map((e) => int.parse(e)).toList());
      }
    } catch (e) {
      print('Error: $e');
    }
    expect(findRiskScoreOfLowPoints(data), 15);
  });

  test('part-2', () async {
    final file = File('bin/input-test.txt');
    List<List<int>> data = [];
    var lines = file
        .openRead()
        .transform(utf8.decoder) // Decode bytes to UTF-8.
        .transform(LineSplitter()); // Convert stream to individual lines.
    try {
      await for (var line in lines) {
        var lineList = line.split('');
        data.add(lineList.map((e) => int.parse(e)).toList());
      }
    } catch (e) {
      print('Error: $e');
    }
    expect(findThreeLargestBassins(data), 1134);
  });
}
