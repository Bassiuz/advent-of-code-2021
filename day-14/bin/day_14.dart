import 'dart:convert';
import 'dart:io';

import 'package:day_14/day_14.dart';

Future<void> main(List<String> arguments) async {
  final file = File('bin/input.txt');
  var instructions = <String>[];
  var polymer = '';

  var lines = file
      .openRead()
      .transform(utf8.decoder) // Decode bytes to UTF-8.
      .transform(LineSplitter()); // Convert stream to individual lines.
  try {
    await for (var line in lines) {
      if (line.contains('->')) {
        instructions.add(line);
      } else if (line.isNotEmpty) {
        polymer = line;
      }
    }
  } catch (e) {
    print('Error: $e');
  }

  print(
      'Count Difference in Elements 10 times (part 1): ${countDifferenceInElements(polymer, instructions, 10)}');

  var stopwatch = Stopwatch()..start();
  print(
      'Count Difference in Elements 40 times (part 2): ${countDifferenceInElements(polymer, instructions, 40)}');
  print(
      'Count Difference in Elements 40 times (part 2): executed in ${stopwatch.elapsed}');
}
