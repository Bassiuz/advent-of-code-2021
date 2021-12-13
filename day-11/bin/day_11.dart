import 'dart:convert';
import 'dart:io';

import 'package:day_11/day_11.dart';

Future<void> main(List<String> arguments) async {
  final file = File('bin/input.txt');
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

  //print(
  //    'Total Flashes after 100 steps (part 1): ${countFlashesAfterSteps(data, 100)}');

  print(
      'Total Steps For Singularity (part 2): ${countStepsAtTotalSimularity(data)}');
}
