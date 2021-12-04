List generateBingoFromData(List<String> data) {
  var result = [];
  var bingo = <String>[];

  for (var i = 0; i < data[0].split(',').length; i++) {
    bingo.add(data[0].split(',')[i]);
  }
  result.add(bingo);

  var cards = [];
  for (var i = 2; i < data.length; i = i + 6) {
    var card = [];
    for (var j = 0; j < 5; j++) {
      var row = [];
      row.addAll(data[i + j].trim().split(' '));
      card.add(row);
    }
    cards.add(card);
  }
  result.add(cards);

  return result;
}

List findLatestBingoCard(List<dynamic> bingoNumbers, List<dynamic> bingoCards) {
  var result = [];
  var latestNumbersWithAllBingos = [];

  for (var numberIndex = 0; numberIndex < bingoNumbers.length; numberIndex++) {
    // decide what numbers we are going to use
    var currentNumbers =
        bingoNumbers.sublist(0, bingoNumbers.length - numberIndex);

    for (var cardIndex = 0; cardIndex < bingoCards.length; cardIndex++) {
      var currentCard = bingoCards[cardIndex];
      if (!cardHasBingoForNumbers(currentNumbers, currentCard)) {
        // this is the first card without bingo!
        result.addAll([latestNumbersWithAllBingos, currentCard]);
      }
    }

    // these numbers have all cards as bingo
    latestNumbersWithAllBingos = currentNumbers;
  }

  return result;
}

bool cardHasBingoForNumbers(
    List<dynamic> currentBingoNumbers, List<dynamic> card) {
  var result = false;

  for (var rowIndex = 0; rowIndex < card.length; rowIndex++) {
    var row = card[rowIndex];
    var bingo = false;
    doesRowContainBingo(row, currentBingoNumbers) ? bingo = true : '';
    var columns = getColumns(card);
    for (var columnIndex = 0; columnIndex < row.length; columnIndex++) {
      var column = columns[columnIndex];
      doesRowContainBingo(column, currentBingoNumbers) ? bingo = true : '';
    }

    if (bingo) {
      return true;
    }
  }
  return result;
}

List findEarlistBingoCard(
    List<dynamic> bingoNumbers, List<dynamic> bingoCards) {
  var result = [];
  var currentBingoNumbers = <String>[];

  for (var numberIndex = 0; numberIndex < bingoNumbers.length; numberIndex++) {
    var bingoNumber = bingoNumbers[numberIndex];
    currentBingoNumbers.add(bingoNumber);

    for (var cardIndex = 0; cardIndex < bingoCards.length; cardIndex++) {
      var card = bingoCards[cardIndex];

      var cardHasBingo = cardHasBingoForNumbers(currentBingoNumbers, card);

      if (cardHasBingo) {
        result.addAll([currentBingoNumbers, card]);
        return result;
      }
    }
  }

  return result;
}

List<List<String>> getColumns(List<dynamic> card) {
  var columns = <List<String>>[];
  for (var i = 0; i < card[0].length; i++) {
    var column = <String>[];
    for (var j = 0; j < card.length; j++) {
      column.add(card[j][i]);
    }
    columns.add(column);
  }

  return columns;
}

bool doesRowContainBingo(List<dynamic> row, List<dynamic> bingoNumbers) {
  var result = true;

  for (var i = 0; i < row.length; i++) {
    var number = row[i];

    if (!bingoNumbers.contains(number)) {
      result = false;
    }
  }

  return result;
}

int calculateScore(List<dynamic> bingoCard, List<dynamic> bingoNumbers) {
  var result = 0;

  for (var i = 0; i < bingoCard.length; i++) {
    var row = bingoCard[i];
    for (var j = 0; j < row.length; j++) {
      var number = row[j];
      if (!bingoNumbers.contains(number)) {
        result = result + int.parse(number);
      }
    }
  }

  return result * int.parse(bingoNumbers.last);
}
