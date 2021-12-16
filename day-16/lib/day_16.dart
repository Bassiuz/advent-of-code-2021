String convertHexadecimalToBitString(String hexadecimalInput) {
  var bitString = '';
  for (var i = 0; i < hexadecimalInput.length; i++) {
    var hexadecimalCharacter = hexadecimalInput.substring(i, i + 1);
    var bitStringCharacter =
        int.parse(hexadecimalCharacter, radix: 16).toRadixString(2);
    while (bitStringCharacter.length < 4) {
      bitStringCharacter = '0' + bitStringCharacter;
    }
    bitString += bitStringCharacter;
  }
  return bitString;
}

num returnTotalFromDataType(String data,
    {String dataType = 'version', bool recursive = true}) {
  var functions =
      convertBitStringToListOfMaps(convertHexadecimalToBitString(data));

  return countVersionTotalFromListOfFunctions(functions, dataType, recursive);
}

num countVersionTotalFromListOfFunctions(
    List<dynamic> functions, String dataType, bool recursive) {
  num versionTotal = 0;

  for (var function in functions) {
    versionTotal = versionTotal + function[dataType];
    if (function['functions'] != null && recursive) {
      versionTotal = versionTotal +
          countVersionTotalFromListOfFunctions(
              function['functions'], dataType, recursive);
    }
  }

  return versionTotal;
}

List<dynamic> returnFirstFunctionFromData(String bitString, int currentEnd) {
  var map = Map<String, dynamic>();
  map['version'] =
      int.parse(bitString.substring(currentEnd, currentEnd + 3), radix: 2);
  map['typeID'] =
      int.parse(bitString.substring(currentEnd + 3, currentEnd + 6), radix: 2);
  currentEnd = currentEnd + 6;

  if (map['typeID'] == 4) {
    var parseNumbers = true;
    var literalValue = '';
    while (parseNumbers) {
      literalValue =
          literalValue + bitString.substring(currentEnd + 1, currentEnd + 5);

      parseNumbers = bitString.substring(currentEnd, currentEnd + 1) == '1';
      currentEnd = currentEnd + 5;
    }

    map['value'] = int.parse(literalValue, radix: 2);
  } else {
    // operator
    map['lengthTypeID'] =
        int.parse(bitString.substring(currentEnd, currentEnd + 1), radix: 2);
    currentEnd = currentEnd + 1;

    if (map['lengthTypeID'] == 0) {
      var length =
          int.parse(bitString.substring(currentEnd, currentEnd + 15), radix: 2);
      map['length'] = length;

      currentEnd = currentEnd + 15;

      var clusterEnd = currentEnd + length;
      map['functions'] = [];

      while (currentEnd < clusterEnd) {
        var function = returnFirstFunctionFromData(bitString, currentEnd);
        map['functions'].add(function[0]);
        currentEnd = function[1] as int;
      }
    } else {
      var numberOfSubpackets =
          int.parse(bitString.substring(currentEnd, currentEnd + 11), radix: 2);
      map['numberOfSubpackets'] = numberOfSubpackets;
      currentEnd = currentEnd + 11;
      map['functions'] = [];
      for (var i = 0; i < numberOfSubpackets; i++) {
        var function = returnFirstFunctionFromData(bitString, currentEnd);
        map['functions'].add(function[0]);
        currentEnd = function[1] as int;
      }
    }
  }

  // calculate value of operators
  if (map['typeID'] == 0) {
    // sum
    var sum = 0;
    for (var function in map['functions']) {
      sum = sum + function['value'] as int;
    }
    map['value'] = sum;
  } else if (map['typeID'] == 1) {
    // product
    var product = 1;
    for (var function in map['functions']) {
      product = product * function['value'] as int;
    }
    map['value'] = product;
  } else if (map['typeID'] == 2) {
    // min
    var min = -1;
    for (var function in map['functions']) {
      if (function['value'] < min || min == -1) {
        min = function['value'] as int;
      }
    }
    map['value'] = min;
  } else if (map['typeID'] == 3) {
    var max = -1;
    for (var function in map['functions']) {
      if (function['value'] > max || max == -1) {
        max = function['value'] as int;
      }
    }
    map['value'] = max;
  } else if (map['typeID'] == 5) {
    // greater than

    if ((map['functions'][0]['value'] as int) >
        (map['functions'][1]['value'] as int)) {
      map['value'] = 1;
    } else {
      map['value'] = 0;
    }
  } else if (map['typeID'] == 6) {
    // less than
    if ((map['functions'][0]['value'] as int) <
        (map['functions'][1]['value'] as int)) {
      map['value'] = 1;
    } else {
      map['value'] = 0;
    }
  } else if (map['typeID'] == 7) {
    // equal to
    if ((map['functions'][0]['value'] as int) ==
        (map['functions'][1]['value'] as int)) {
      map['value'] = 1;
    } else {
      map['value'] = 0;
    }
  }

  List<dynamic> result = [];
  result.add(map);
  result.add(currentEnd);

  return result;
}

List<Map<String, dynamic>> convertBitStringToListOfMaps(String bitString) {
  var listOfMaps = List<Map<String, dynamic>>.empty(growable: true);

  int currentEnd = 0;
  while (bitString.substring(currentEnd).isNotEmpty &&
      bitString
          .substring(currentEnd)
          .contains('1')) // stop when only trailing 0's remain
  {
    var result = returnFirstFunctionFromData(bitString, currentEnd);
    listOfMaps.add(result[0]);
    currentEnd = result[1];
  }

  return listOfMaps;
}
