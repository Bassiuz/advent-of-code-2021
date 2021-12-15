import 'dart:convert';
import 'dart:io';

import 'package:day_15/day_15.dart';
import 'package:test/test.dart';

void main() {
  Future<List<List<int>>> buildTestMap() async {
    final file = File('bin/input-test-big.txt');
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

  test('part 1', () async {
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

    expect(shortestRoute(data), 40);
  });

  test('part 2 beta', () async {
    final file = File('bin/input-test-big.txt');
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

    expect(shortestRoute(data), 315);
  });

  test('part 2', () async {
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
    List<List<int>> testMap = await buildTestMap();
    List<List<int>> generatedMap = buildFullMap(data, 5);

    for (var i = 0; i < testMap.length; i++) {
      for (var j = 0; j < testMap[i].length; j++) {
        var testvalue = testMap[i][j];
        var generatedvalue = generatedMap[i][j];
        expect(testvalue, generatedvalue,
            reason: 'Grid should match: $generatedvalue $testvalue on $i $j');
      }
    }

    expect(shortestRoute(buildFullMap(data, 5)), 315);
  });
}
