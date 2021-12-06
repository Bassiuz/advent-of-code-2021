int amountOfFish(String fishList, int days) {
  var fish = fishList.split(',').map((f) => int.parse(f)).toList();
  var fishCount = <int, int>{};

  fish.forEach((element) {
    var newCount = fishCount[element] ?? 0;
    fishCount[element] = newCount + 1;
  });

  for (var i = 0; i < days; i++) {
    var newFishCount = <int, int>{};
    newFishCount[0] = fishCount[1] ?? 0;
    newFishCount[1] = fishCount[2] ?? 0;
    newFishCount[2] = fishCount[3] ?? 0;
    newFishCount[3] = fishCount[4] ?? 0;
    newFishCount[4] = fishCount[5] ?? 0;
    newFishCount[5] = fishCount[6] ?? 0;
    newFishCount[6] = (fishCount[7] ?? 0) + (fishCount[0] ?? 0);
    newFishCount[7] = fishCount[8] ?? 0;
    newFishCount[8] = fishCount[0] ?? 0;
    fishCount = newFishCount;
  }
  var result = 0;
  fishCount.forEach((key, value) {
    result += value;
  });
  return result;
}
