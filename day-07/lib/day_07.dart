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

int target(String input) {
  var inputArray = input.split(',').map((s) => int.parse(s)).toList();
  inputArray.sort();

  var totalMiddlepoints = 0;

  for (var i = 0; i < (inputArray.length / 2); i++) {
    var first = inputArray[i];
    var last = inputArray[inputArray.length - i - 1];

    var dif = last - first;
    var middlepoint = first + (dif ~/ 2);

    if (i + 1 > inputArray.length / 2) {
      print('let this count for half');
      totalMiddlepoints += middlepoint ~/ 2;
    } else {
      totalMiddlepoints += middlepoint;
    }
  }

  return (totalMiddlepoints / (inputArray.length / 2)).round();
}

int costOfFuelForAllToAverage(String input) {
  var inputArray = input.split(',').map((s) => int.parse(s)).toList();
  inputArray.sort();

  var average = target(input);

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
