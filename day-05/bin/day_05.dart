import 'dart:io';
import 'dart:convert';

import 'package:day_05/day_05.dart';

Future<void> main(List<String> arguments) async {
  final file = File('bin/input.txt');
  var data = <String>[];
  var lines = file
      .openRead()
      .transform(utf8.decoder) // Decode bytes to UTF-8.
      .transform(LineSplitter()); // Convert stream to individual lines.
  try {
    await for (var line in lines) {
      data.add(line);
    }
  } catch (e) {
    print('Error: $e');
  }

  var stopwatch = Stopwatch()..start();
  print('Part 1: ${findOverlappingPointsInLines(data)}');
  print('findOverlappingPointsInLines() executed in ${stopwatch.elapsed}');

  var stopwatch2 = Stopwatch()..start();
  print('Part 2: ${findOverlappingPointsInLinesAndDiagnoals(data)}');
  print(
      'findOverlappingPointsInLinesAndDiagnoals() executed in ${stopwatch2.elapsed}');
}
