import 'dart:convert';
import 'dart:io';

import 'package:day_16/day_16.dart' as day_16;
import 'package:day_16/day_16.dart';

Future<void> main(List<String> arguments) async {
  final file = File('bin/input.txt');
  var data = '';

  var lines = file
      .openRead()
      .transform(utf8.decoder) // Decode bytes to UTF-8.
      .transform(LineSplitter()); // Convert stream to individual lines.
  try {
    await for (var line in lines) {
      data = line;
    }
  } catch (e) {
    print('Error: $e');
  }

  var versionTotal = returnTotalFromDataType(data);
  print('adding all the version totals (part 1) = $versionTotal');
  var value =
      returnTotalFromDataType(data, dataType: 'value', recursive: false);

  print('value of all operators (part 2) = $value');
}
