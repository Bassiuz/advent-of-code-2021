int countIncreases(currentCount, List<int> data) {
  return countIncreasesBasedOnXBaseValues(currentCount, data, xBase: 1);
}

int countIncreasesBasedOnXBaseValues(currentCount, List<int> data,
    {int xBase = 3}) {
  var baseValue = 0;
  var compareValue = 0;

  for (var i = 0; i <= xBase - 1; i++) {
    baseValue += data[i];
  }

  for (var i = 1; i <= xBase; i++) {
    compareValue += data[i];
  }

  if (baseValue < compareValue) {
    currentCount++;
  }

  data.removeAt(0);

  if (data.length > xBase) {
    return countIncreasesBasedOnXBaseValues(currentCount, data, xBase: xBase);
  } else {
    return currentCount;
  }
}
