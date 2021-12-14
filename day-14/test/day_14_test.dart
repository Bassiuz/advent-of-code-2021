import 'dart:convert';
import 'dart:io';

import 'package:day_14/day_14.dart';
import 'package:test/test.dart';

void main() {
  test('part 1', () async {
    final file = File('bin/input-test.txt');
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

    expect(countDifferenceInElements(polymer, instructions, 10), 1588);
    expect(countDifferenceInElements(polymer, instructions, 40), 2188189693529);
  });
}
