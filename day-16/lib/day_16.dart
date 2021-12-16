import 'dart:mirrors';

String convertHexadecimalToBitString(String hexadecimalInput) {
  var bitString = "";
  for (var i = 0; i < hexadecimalInput.length; i++) {
    var hexadecimalCharacter = hexadecimalInput.substring(i, i + 1);
    var bitStringCharacter =
        int.parse(hexadecimalCharacter, radix: 16).toRadixString(2);
    while (bitStringCharacter.length < 4) {
      bitStringCharacter = "0" + bitStringCharacter;
    }
    bitString += bitStringCharacter;
  }
  return bitString;
}

num returnVersionTotalFromData(String data) {
  var functions =
      convertBitStringToListOfMaps(convertHexadecimalToBitString(data));

  return countVersionTotalFromListOfFunctions(functions);
}

num countVersionTotalFromListOfFunctions(List<dynamic> functions) {
  num versionTotal = 0;

  for (var function in functions) {
    versionTotal = versionTotal + function["version"];
    if (function["functions"] != null) {
      versionTotal = versionTotal +
          countVersionTotalFromListOfFunctions(function["functions"]);
    }
  }

  return versionTotal;
}

List<dynamic> returnFirstFunctionFromData(String bitString, int currentEnd) {
  var map = Map<String, dynamic>();
  map["version"] =
      int.parse(bitString.substring(currentEnd, currentEnd + 3), radix: 2);
  map["typeID"] =
      int.parse(bitString.substring(currentEnd + 3, currentEnd + 6), radix: 2);
  currentEnd = currentEnd + 6;

  if (map["typeID"] == 4) {
    var parseNumbers = true;
    var literalValue = "";
    while (parseNumbers) {
      literalValue =
          literalValue + bitString.substring(currentEnd + 1, currentEnd + 5);

      parseNumbers = bitString.substring(currentEnd, currentEnd + 1) == '1';
      currentEnd = currentEnd + 5;
    }

    map["literalValue"] = int.parse(literalValue, radix: 2);
  } else {
    // operator
    map["lengthTypeID"] =
        int.parse(bitString.substring(currentEnd, currentEnd + 1), radix: 2);
    currentEnd = currentEnd + 1;

    if (map["lengthTypeID"] == 0) {
      var length =
          int.parse(bitString.substring(currentEnd, currentEnd + 15), radix: 2);
      map["length"] = length;

      currentEnd = currentEnd + 15;

      var clusterEnd = currentEnd + length;
      map["functions"] = [];

      while (currentEnd < clusterEnd) {
        var function = returnFirstFunctionFromData(bitString, currentEnd);
        map["functions"].add(function[0]);
        currentEnd = function[1] as int;
      }
    } else {
      var numberOfSubpackets =
          int.parse(bitString.substring(currentEnd, currentEnd + 11), radix: 2);
      map["numberOfSubpackets"] = numberOfSubpackets;
      currentEnd = currentEnd + 11;
      map["functions"] = [];
      for (var i = 0; i < numberOfSubpackets; i++) {
        var function = returnFirstFunctionFromData(bitString, currentEnd);
        map["functions"].add(function[0]);
        currentEnd = function[1] as int;
      }
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
