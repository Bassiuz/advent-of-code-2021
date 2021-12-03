int findNumberWithCommonDenominatorInBit(List<String> input) {
  return int.parse(findBinaryWithCommonDenominatorInBit(input), radix: 2);
}

int findNumberWithUncommonDenominatorInBit(List<String> input) {
  return int.parse(
      findBinaryWithCommonDenominatorInBit(input, useMostCommon: false),
      radix: 2);
}

int findNumberWithMostCommonDenominators(List<String> input) {
  return int.parse(findBinaryWithMostCommonDenominators(input), radix: 2);
}

int findNumberWithMostUncommonDenominators(List<String> input) {
  return int.parse(
      findBinaryWithMostCommonDenominators(input, useMostCommon: false),
      radix: 2);
}

String findBinaryWithMostCommonDenominators(List<String> input,
    {bool useMostCommon = true}) {
  var result = '';

  for (var i = 0; i < input[0].length; i++) {
    var zeroCount = 0;
    var oneCount = 0;

    var currentInputs = input.where((f) => f.startsWith(result)).toList();

    for (var j = 0; j < currentInputs.length; j++) {
      if (currentInputs[j][i] == '1') {
        oneCount += 1;
      } else {
        zeroCount += 1;
      }
    }

    // do this to prevent ending on numbers not existing
    if (zeroCount == 0) {
      result += '1';
    } else if (oneCount == 0) {
      result += '0';
    } else if (useMostCommon) {
      if (oneCount >= zeroCount) {
        result += '1';
      } else {
        result += '0';
      }
    } else {
      if (oneCount >= zeroCount) {
        result += '0';
      } else {
        result += '1';
      }
    }
  }
  return result;
}

String findBinaryWithCommonDenominatorInBit(List<String> input,
    {bool useMostCommon = true}) {
  var result = '';

  for (var i = 0; i < input[0].length; i++) {
    var zeroCount = 0;
    var oneCount = 0;
    for (var j = 0; j < input.length; j++) {
      if (input[j][i] == '1') {
        oneCount += 1;
      } else {
        zeroCount += 1;
      }
    }

    if (zeroCount > oneCount) {
      useMostCommon ? result += '0' : result += '1';
    } else {
      useMostCommon ? result += '1' : result += '0';
    }
  }
  return result;
}
