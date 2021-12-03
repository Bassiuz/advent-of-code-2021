import 'dart:io';
import 'dart:convert';

import 'package:day_03/day_03.dart';

Future<void> main(List<String> arguments) async {
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

  print(findNumberWithCommonDenominatorInBit(data) *
      findNumberWithUncommonDenominatorInBit(data));

  print(findNumberWithMostCommonDenominators(data) *
      findNumberWithMostUncommonDenominators(data));
}
