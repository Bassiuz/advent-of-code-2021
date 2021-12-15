import 'dart:convert';
import 'dart:io';

import 'package:day_15/day_15.dart';

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

  print('Length of shortest route to end: ${shortestRoute(data)}');

  print(
      'Length of shortest route to end: ${shortestRoute(buildFullMap(data, 5))}');
}
