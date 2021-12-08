import 'dart:convert';
import 'dart:io';

import 'package:day_08/day_08.dart';

Future<void> main() async {
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

  var count = 0;

  for (var string in data) {
    string.split(' | ')[1].split(' ').forEach((element) {
      if (element.length == 4 ||
          element.length == 2 ||
          element.length == 3 ||
          element.length == 7) {
        count++;
      }
    });
  }

  print('part 1: $count');
  var yolo = countTotalOfDisplays(data);
  print('part 2: $yolo');
}
