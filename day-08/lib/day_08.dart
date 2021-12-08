int countTotalOfDisplays(List<String> data) {
  int count = 0;
  for (String line in data) {
    print(line);
    var value = countValueOfDisplay(line);
    print(value);
    count = count + value;
  }
  return count;
}

int countValueOfDisplay(String line) {
  var digits = new Map<String, String>();

  String measurements = line.split(' | ')[0];
  String valueOfDisplay = line.split(' | ')[1];

  digits['1'] = determineOneFromSet(measurements)!;
  digits['4'] = determineFourFromSet(measurements)!;
  digits['7'] = determineSevenFromSet(measurements)!;
  digits['8'] = determineEightFromSet(measurements)!;
  digits['9'] = dertermineNineFromSetWithFour(measurements, digits['4']!)!;
  digits['0'] = dertermineZeroFromSetWithNineAndOne(
      measurements, digits['1']!, digits['9']!)!;
  digits['6'] = dertermineSixFromSetWithZeroAndNine(
      measurements, digits['0']!, digits['9']!)!;
  digits['3'] = dertermineThreeFromSetWithOne(measurements, digits['1']!)!;
  digits['5'] = dertermineFiveFromSetWithNineAndThree(
      measurements, digits['9']!, digits['3']!)!;
  digits['2'] = dertermineTwoFromSetWithFiveAndThree(
      measurements, digits['5']!, digits['3']!)!;

  var result = "";

  for (var digit in splitAndFormatDigits(valueOfDisplay)!) {
    digits.forEach((k, v) {
      if (v == digit) {
        result = result + k;
      }
    });
  }

  return int.parse(result.trim());
}

String? determineOneFromSet(String measurements) {
  for (var digit in splitAndFormatDigits(measurements)!) {
    if (digit.length == 2) {
      return digit;
    }
  }
}

String? determineSevenFromSet(String measurements) {
  for (var digit in splitAndFormatDigits(measurements)!) {
    if (digit.length == 3) {
      return digit;
    }
  }
}

String? determineFourFromSet(String measurements) {
  for (var digit in splitAndFormatDigits(measurements)!) {
    if (digit.length == 4) {
      return digit;
    }
  }
}

String? determineEightFromSet(String measurements) {
  for (var digit in splitAndFormatDigits(measurements)!) {
    if (digit.length == 7) {
      return digit;
    }
  }
}

String? dertermineNineFromSetWithFour(String measurements, String four) {
  for (var digit in splitAndFormatDigits(measurements)!) {
    if (digit.length == 6) {
      var containsFour = true;
      for (var letter in four.split('')) {
        if (!digit.contains(letter)) {
          containsFour = false;
        }
      }
      if (containsFour == true) {
        return digit;
      }
    }
  }
}

String? dertermineZeroFromSetWithNineAndOne(
    String measurements, String one, String nine) {
  for (var digit in splitAndFormatDigits(measurements)!) {
    if (digit.length == 6) {
      var containsOne = true;
      for (var letter in one.split('')) {
        if (!digit.contains(letter)) {
          containsOne = false;
        }
      }
      if (containsOne == true && digit != nine) {
        return digit;
      }
    }
  }
}

String? dertermineSixFromSetWithZeroAndNine(
    String measurements, String zero, String nine) {
  for (var digit in splitAndFormatDigits(measurements)!) {
    if (digit.length == 6) {
      if (digit != zero && digit != nine) {
        return digit;
      }
    }
  }
}

String? dertermineThreeFromSetWithOne(String measurements, String one) {
  for (var digit in splitAndFormatDigits(measurements)!) {
    if (digit.length == 5) {
      var containsOne = true;
      for (var letter in one.split('')) {
        if (!digit.contains(letter)) {
          containsOne = false;
        }
      }
      if (containsOne == true) {
        return digit;
      }
    }
  }
}

String? dertermineFiveFromSetWithNineAndThree(
    String measurements, String nine, String three) {
  for (var digit in splitAndFormatDigits(measurements)!) {
    if (digit.length == 5) {
      var nineContainsDigit = true;
      for (var letter in digit.split('')) {
        if (!nine.contains(letter)) {
          nineContainsDigit = false;
        }
      }
      if (nineContainsDigit == true && digit != three) {
        return digit;
      }
    }
  }
}

String? dertermineTwoFromSetWithFiveAndThree(
    String measurements, String five, String three) {
  for (var digit in splitAndFormatDigits(measurements)!) {
    if (digit.length == 5) {
      if (digit != five && digit != three) {
        return digit;
      }
    }
  }
}

List<dynamic>? splitAndFormatDigits(String measurements) {
  var digits = [];

  for (var digit in measurements.split(' ')) {
    var list = digit.split('')..sort();
    digits.add(list.join());
  }
  return digits;
}
