int countFlashesAfterSteps(List<List<int>> data, int steps) {
  var flashCount = performStep(data);

  if (steps == 1) {
    return flashCount;
  }

  return flashCount + countFlashesAfterSteps(data, steps - 1);
}

int performStep(List<List<int>> data) {
  var flashCount = 0;
  // loop through all octopusses in grid
  for (var x = 0; x < data.length; x++) {
    for (var y = 0; y < data[x].length; y++) {
      // up their energy for the 'step'
      data[x][y] = data[x][y] + 1;
    }
  }

  // loop through all octopusses in grid
  while (gridContainsNine(data)) {
    for (var x = 0; x < data.length; x++) {
      for (var y = 0; y < data[x].length; y++) {
        if (data[x][y] > 9) {
          // this octopus flashes
          data[x][y] = 0;
          flashCount++;

          // find neighbours
          var neighbours = findNeighbours(data, x, y);
          for (var i = 0; i < neighbours.length; i++) {
            // up their energy if they did not flash yet
            if (data[neighbours[i][0]][neighbours[i][1]] != 0) {
              data[neighbours[i][0]][neighbours[i][1]] =
                  data[neighbours[i][0]][neighbours[i][1]] + 1;
            }
          }
        }
      }
    }
  }
  return flashCount;
}

int countStepsAtTotalSimularity(List<List<int>> data) {
  var stepCount = 0;
  while (gridContainsOneOrHigher(data)) {
    stepCount++;
    performStep(data);
  }

  return stepCount;
}

bool gridContainsNine(List<List<int>> data) {
  for (var x = 0; x < data.length; x++) {
    for (var y = 0; y < data[x].length; y++) {
      if (data[x][y] > 9) {
        return true;
      }
    }
  }
  return false;
}

bool gridContainsOneOrHigher(List<List<int>> data) {
  for (var x = 0; x < data.length; x++) {
    for (var y = 0; y < data[x].length; y++) {
      if (data[x][y] > 0) {
        return true;
      }
    }
  }
  return false;
}

List<List<int>> findNeighbours(List<List<int>> dataList, int x, int y) {
  var neighbours = <List<int>>[];
  if (x > 0) {
    neighbours.add([x - 1, y]);
    if (y > 0) {
      neighbours.add([x - 1, y - 1]);
    }
    if (y < dataList[x].length - 1) {
      neighbours.add([x - 1, y + 1]);
    }
  }
  if (x < dataList.length - 1) {
    neighbours.add([x + 1, y]);
    if (y > 0) {
      neighbours.add([x + 1, y - 1]);
    }
    if (y < dataList[x].length - 1) {
      neighbours.add([x + 1, y + 1]);
    }
  }
  if (y > 0) {
    neighbours.add([x, y - 1]);
  }
  if (y < dataList[x].length - 1) {
    neighbours.add([x, y + 1]);
  }
  return neighbours;
}
