int costOfFuelForAllToMedian(String input) {
  var inputArray = input.split(',').map((s) => int.parse(s)).toList();
  inputArray.sort();
  var median = inputArray[inputArray.length ~/ 2];
  var totalFuel = 0;

  inputArray.forEach((element) {
    if (element > median) {
      totalFuel += element - median;
    } else {
      totalFuel += median - element;
    }
  });

  return totalFuel;
}

int costOfFuelForAllToAverage(String input) {
  var inputArray = input.split(',').map((s) => int.parse(s)).toList();
  inputArray.sort();

  var totalMiddlepoints = 0;

  for (var i = 0; i < (inputArray.length / 2); i++) {
    var first = inputArray[i];
    var last = inputArray[inputArray.length - i - 1];
    var dif = last - first;
    var middlepoint = first + (dif ~/ 2);
    totalMiddlepoints += middlepoint;
  }

  var average = (totalMiddlepoints / (inputArray.length / 2)).round();

  var totalFuel = 0;

  inputArray.forEach((element) {
    var stepsNeeded = 0;
    if (element > average) {
      stepsNeeded = element - average;
    } else {
      stepsNeeded = average - element;
    }
    totalFuel += stepsNeeded * (stepsNeeded + 1) ~/ 2;
  });

  return totalFuel;
}
