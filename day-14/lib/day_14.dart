int countDifferenceInElements(
    String polymer, List<String> instructions, int steps) {
  Map<String, int> pairCount = {};
  for (var i = 0; i < polymer.length - 1; i++) {
    var pair = polymer[i] + polymer[i + 1];
    if (pairCount.containsKey(pair)) {
      pairCount[pair] = pairCount[pair]! + 1;
    } else {
      pairCount[pair] = 1;
    }
  }

  for (var i = 0; i < steps; i++) {
    pairCount = processPolymer(pairCount, instructions);
  }

  var charCount = mapPairCountMapToCharCountMap(pairCount);
  charCount[polymer[0]] = charCount[polymer[0]]! + 1;

  var low = -1;
  var high = 0;

  charCount.forEach((key, value) {
    if (value < low || low == -1) {
      low = value;
    }
    if (value > high) {
      high = value;
    }
  });

  return high - low;
}

Map<String, int> mapPairCountMapToCharCountMap(Map<String, int> map) {
  Map<String, int> charCount = {};
  map.forEach((key, value) {
    if (charCount.containsKey(key[1])) {
      charCount[key[1]] = charCount[key[1]]! + value;
    } else {
      charCount[key[1]] = value;
    }
  });
  return charCount;
}

Map<String, int> processPolymer(
    Map<String, int> pairCount, List<String> instructions) {
  Map<String, int> newPairCount = {};

  for (var instruction in instructions) {
    var pair = instruction.split(' -> ')[0];
    var addsLetter = instruction.split(' -> ')[1];
    var resultingPairs = [
      pair.split('')[0] + addsLetter,
      addsLetter + pair.split('')[1]
    ];

    var pairsFound = pairCount[pair] ?? 0;
    for (var resultingpair in resultingPairs) {
      if (newPairCount.containsKey(resultingpair)) {
        newPairCount[resultingpair] = newPairCount[resultingpair]! + pairsFound;
      } else {
        newPairCount[resultingpair] = pairsFound;
      }
    }
  }
  return newPairCount;
}
