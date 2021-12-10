import 'dart:convert';
import 'dart:io';

import 'package:day_10/day_10.dart';

Future<void> main(List<String> arguments) async {
  final file = File('bin/input.txt');
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

  print('Part 1: ${countTotalSyntaxErrorScore(data)}');
  print('Part 2: ${countTotalUnfinishedLineScore(data)}');
}
