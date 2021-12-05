int findOverlappingPointsInLines(List<String> lines) {
  var points = <int>[];

  for (var line in lines) {
    if (isNonDiagonalLine(line)) {
      points.addAll(pointsFromLine(line));
    }
  }

  return countDoubleValuesInArray(points);
}

int findOverlappingPointsInLinesAndDiagnoals(List<String> lines) {
  var points = <int>[];

  for (var line in lines) {
    if (isNonDiagonalLine(line)) {
      points.addAll(pointsFromLine(line));
    } else {
      points.addAll(pointsFromDiagonal(line));
    }
  }

  return countDoubleValuesInArray(points);
}

bool isNonDiagonalLine(String line) {
  var startPoint = line.split(' -> ')[0];
  var endPoint = line.split(' -> ')[1];

  var startPointX = int.parse(startPoint.split(',')[0]);
  var startPointY = int.parse(startPoint.split(',')[1]);

  var endPointX = int.parse(endPoint.split(',')[0]);
  var endPointY = int.parse(endPoint.split(',')[1]);

  return startPointX == endPointX || startPointY == endPointY;
}

Iterable<int> pointsFromLine(String line) {
  var points = <int>[];

  var startPoint = line.split(' -> ')[0];
  var endPoint = line.split(' -> ')[1];

  var startPointX = int.parse(startPoint.split(',')[0]);
  var startPointY = int.parse(startPoint.split(',')[1]);

  var endPointX = int.parse(endPoint.split(',')[0]);
  var endPointY = int.parse(endPoint.split(',')[1]);

  if (startPointX > endPointX) {
    var temp = startPointX;
    startPointX = endPointX;
    endPointX = temp;
  }

  if (startPointY > endPointY) {
    var temp = startPointY;
    startPointY = endPointY;
    endPointY = temp;
  }

  for (var x = startPointX; x <= endPointX; x++) {
    for (var y = startPointY; y <= endPointY; y++) {
      points.add(x * 10000 + y);
    }
  }

  return points;
}

Iterable<int> pointsFromDiagonal(String line) {
  var points = <int>[];

  var startPoint = line.split(' -> ')[0];
  var endPoint = line.split(' -> ')[1];

  var startPointX = int.parse(startPoint.split(',')[0]);
  var startPointY = int.parse(startPoint.split(',')[1]);

  var endPointX = int.parse(endPoint.split(',')[0]);
  var endPointY = int.parse(endPoint.split(',')[1]);

  var amountOfSteps = endPointX - startPointX;
  if (amountOfSteps < 0) {
    amountOfSteps = -amountOfSteps;
  }

  for (var i = 0; i <= amountOfSteps; i++) {
    var x;
    var y;
    if (startPointX < endPointX) {
      x = startPointX + i;
    } else {
      x = startPointX - i;
    }
    if (startPointY < endPointY) {
      y = startPointY + i;
    } else {
      y = startPointY - i;
    }
    points.add(x * 10000 + y);
  }

  return points;
}

int countDoubleValuesInArray(List<int> array) {
  var doubleValues = 0;

  var doublesAlreadyCounted = [];

  for (var i = 0; i < array.length; i++) {
    for (var j = i + 1; j < array.length; j++) {
      if (array[i] == array[j] && !doublesAlreadyCounted.contains(array[i])) {
        doublesAlreadyCounted.add(array[i]);
        doubleValues++;
      }
    }
  }

  return doubleValues;
}
