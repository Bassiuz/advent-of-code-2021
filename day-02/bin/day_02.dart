import 'dart:io';
import 'dart:convert';

import 'package:day_02/day_02.dart';

void main() async {
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

  print('Solution part 1: ' +
      multiplyHorizontalAndVerticalPoisitionOfCommands(List.from(data))
          .toString());

  print('Solution part 2: ' +
      getLocationResultWithAim(List.from(data)).toString());
}
