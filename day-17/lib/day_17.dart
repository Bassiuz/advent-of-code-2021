int differentAmountOfVelocities(String input) {
  var xStart = int.parse(input.split('x=')[1].split('..')[0]);
  var xEnd = int.parse(input.split('x=')[1].split('..')[1].split(', ')[0]);
  var yStart = int.parse(input.split('y=')[1].split('..')[0]);
  var yEnd = int.parse(input.split('y=')[1].split('..')[1]);

  var wantedXVelocityResult = findFactorialEndingInRange(
      xStart, xEnd); // factorial is not right but looks like it..

  var minimalSteps = wantedXVelocityResult[1];
  var lowestXVelocity = wantedXVelocityResult[0];
  var endX = wantedXVelocityResult[2];

  var highestYVelocity = findHighestYVelocity(yStart, yEnd);
  var lowestYVelocity = yStart;
  var highestXVelocity = xEnd;

  var shotsCount = 0;

  for (var i = lowestXVelocity; i <= highestXVelocity; i++) {
    for (var j = lowestYVelocity; j <= highestYVelocity; j++) {
      if (findIfVelocityEndsInRange(i, j, xStart, xEnd, yStart, yEnd)) {
        shotsCount++;
      }
    }
  }

  return shotsCount;
}

bool findIfVelocityEndsInRange(
    int xVelocity, int yVelocity, int xStart, int xEnd, int yStart, int yEnd) {
  var overshot = false;
  var point = [0, 0];

  var step = 0;
  while (!overshot) {
    point = pointAfterSteps(step, xVelocity, yVelocity);

    if (point[0] > xEnd || point[1] < yStart) {
      overshot = true;
    } else if ((point[0] >= xStart && point[0] <= xEnd) &&
        (point[1] >= yStart && point[1] <= yEnd)) {
      return true;
    }

    step++;
  }

  return false;
}

double highestYFromShotInto(String input) {
  // parse input
  var xStart = int.parse(input.split('x=')[1].split('..')[0]);
  var xEnd = int.parse(input.split('x=')[1].split('..')[1].split(', ')[0]);
  var yStart = int.parse(input.split('y=')[1].split('..')[0]);
  var yEnd = int.parse(input.split('y=')[1].split('..')[1]);

  // steps to find finding a point that stops translating on x on the last x spot
  var wantedXVelocityResult = findFactorialEndingInRange(
      xStart, xEnd); // factorial is not right but looks like it..

  var minimalSteps = wantedXVelocityResult[1];
  var wantedXVelocity = wantedXVelocityResult[0];
  var endX = wantedXVelocityResult[2];

  var wantedYVelocity = findHighestYVelocity(yStart, yEnd);

  return (wantedYVelocity * wantedYVelocity + wantedYVelocity) / 2;
}

int findHighestYVelocity(int yStart, int yEnd) {
  var velocity;
  for (var i = yStart * -1; i > yEnd * -1; i--) {
    var yResult = 0;
    var step = 1;
    while (yResult > yStart) {
      yResult = pointAfterSteps(step, 10, i)[1]; // x velocity doesn't matter
      step = step + 1;
    }

    if (yResult <= yEnd && yResult >= yStart) {
      velocity = i;
      break;
    }
  }

  return velocity;
}

List<int> findFactorialEndingInRange(int xStart, int xEnd) {
  var factorial;
  var endCoordinate;
  var i = 1;
  while (factorial == null) {
    var result = 0;

    for (var j = 1; j <= i; j++) {
      result = result + j;
    }

    if (result <= xEnd && result >= xStart) {
      // found the factorial
      factorial = i;
      endCoordinate = result;
    }

    i++;

    if (result > xEnd) {
      print('no factorial lands inside the range!');
    }
  }

  return [factorial, i - 1, endCoordinate];
}

List<int> pointAfterSteps(int step, int xVelocity, int yVelocity) {
  var point = [0, 0];
  var x = 0;
  var y = 0;

  for (var i = 0; i < step; i++) {
    x += xVelocityAfterSteps(i, xVelocity);
    y += yVelocity - i;
    point = [x, y];
  }

  return point;
}

int xVelocityAfterSteps(int step, int originalXVelocity) {
  if (originalXVelocity > 0) {
    return originalXVelocity - step > 0 ? originalXVelocity - step : 0;
  } else {
    return originalXVelocity + step < 0 ? originalXVelocity + step : 0;
  }
}
