int amountOfFish(String fishList, int days) {
  var fish = fishList.split(',').map((f) => int.parse(f)).toList();
  var fishCount = <int, int>{};

  // parse fish to map
  fish.forEach((element) {
    var newCount = fishCount[element] ?? 0;
    fishCount[element] = newCount + 1;
  });

  // loop through days and map fish to day count
  for (var i = 0; i < days; i++) {
    var newFishCount = <int, int>{};
    for (var j = 0; j < 9; j++) {
      newFishCount[j] = fishCount[j + 1] ?? 0;
      if (j == 8) {
        newFishCount[j] = fishCount[0] ?? 0;
      }
      if (j == 6) {
        newFishCount[j] = (newFishCount[j] ?? 0) + (fishCount[0] ?? 0);
      }
    }
    fishCount = newFishCount;
  }

  // count result
  var result = 0;
  fishCount.forEach((key, value) {
    result += value;
  });
  return result;
}
