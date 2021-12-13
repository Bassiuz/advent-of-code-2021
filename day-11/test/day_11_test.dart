import 'dart:convert';
import 'dart:io';

import 'package:day_11/day_11.dart';
import 'package:test/test.dart';

void main() {
  Future<List<List<int>>> getData() async {
    final file = File('bin/test-input.txt');
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

    return data;
  }

  test('part 1 ', () async {
    expect(countFlashesAfterSteps(await getData(), 2), 35);
    expect(countFlashesAfterSteps(await getData(), 3), 35 + 45);

    expect(countFlashesAfterSteps(await getData(), 10), 204);
    expect(countFlashesAfterSteps(await getData(), 100), 1656);
  });

  test('part 2', () async {
    expect(countStepsAtTotalSimularity(await getData()), 195);
  });
}
