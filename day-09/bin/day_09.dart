import 'dart:convert';
import 'dart:io';

import 'package:day_09/day_09.dart' as day_09;
import 'package:day_09/day_09.dart';

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

  print('part 1: ${findRiskScoreOfLowPoints(data)}');
  print('part 2: ${findThreeLargestBassins(data)}');
}
