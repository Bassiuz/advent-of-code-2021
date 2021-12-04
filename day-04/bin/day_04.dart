import 'dart:io';
import 'dart:convert';

import 'package:day_04/day_04.dart';

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

  var generateBingo = generateBingoFromData(data);
  var bingoNumbers = generateBingo[0];
  var boards = generateBingo[1];

  var winner = findEarlistBingoCard(bingoNumbers, boards);
  var loser = findLatestBingoCard(bingoNumbers, boards);

  print(calculateScore(winner[1], winner[0]));
  print(calculateScore(loser[1], loser[0]));
}
