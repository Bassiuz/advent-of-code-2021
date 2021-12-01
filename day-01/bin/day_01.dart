import 'package:day_01/day_01.dart' as day_01;
import 'dart:io';
import 'dart:convert';
import 'dart:async';

import 'package:day_01/day_01.dart';

void main() async {
  final file = File('bin/input.txt');
  var data = <int>[];
  var lines = file
      .openRead()
      .transform(utf8.decoder) // Decode bytes to UTF-8.
      .transform(LineSplitter()); // Convert stream to individual lines.
  try {
    await for (var line in lines) {
      data.add(int.parse(line));
    }
    print('File is now closed.');
  } catch (e) {
    print('Error: $e');
  }

  print('Amount of increases: ' +
      countIncreasesBasedOnXBaseValues(0, List.from(data), xBase: 1)
          .toString());
  print('Amount of increases based on 3 base numbers: ' +
      countIncreasesBasedOnXBaseValues(0, List.from(data), xBase: 3)
          .toString());
}
