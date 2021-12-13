import 'dart:convert';
import 'dart:io';

import 'package:day_13/day_13.dart';

Future<void> main(List<String> arguments) async {
  final file = File('bin/input.txt');
  var instructions = <String>[];
  var coordinates = List<List<int>>.empty(growable: true);

  var lines = file
      .openRead()
      .transform(utf8.decoder) // Decode bytes to UTF-8.
      .transform(LineSplitter()); // Convert stream to individual lines.
  try {
    await for (var line in lines) {
      if (line.contains('=')) {
        instructions.add(line);
      } else if (line.contains(',')) {
        coordinates.add(
            [int.parse(line.split(',')[0]), int.parse(line.split(',')[1])]);

        coordinates.add(
            [int.parse(line.split(',')[0]), int.parse(line.split(',')[1])]);
      }
    }
  } catch (e) {
    print('Error: $e');
  }

  var firstInstruction = <String>[instructions[0]];
  print(
      'Count entrants after first fold: ${countEntrantsAfterFolds(firstInstruction, coordinates)}');

  print('Message after all folds:');

  printMessageAfterFolds(instructions, coordinates);
}
