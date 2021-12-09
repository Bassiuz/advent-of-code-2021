int findRiskScoreOfLowPoints(List<List<int>> dataList) {
  int riskScore = 0;

  for (int x = 0; x < dataList.length; x++) {
    for (int y = 0; y < dataList[x].length; y++) {
      var data = dataList[x][y];
      var smallest = true;
      for (int neighbour in findNeigboursFor(x, y, dataList)) {
        if (neighbour <= data) {
          smallest = false;
        }
      }

      if (smallest) {
        riskScore += data + 1;
      }
    }
  }
  return riskScore;
}

List<int> findNeigboursFor(int x, int y, List<List<int>> dataList) {
  var neighbours = <int>[];
  if (x > 0) {
    neighbours.add(dataList[x - 1][y]);
  }
  if (x < dataList.length - 1) {
    neighbours.add(dataList[x + 1][y]);
  }
  if (y > 0) {
    neighbours.add(dataList[x][y - 1]);
  }
  if (y < dataList[x].length - 1) {
    neighbours.add(dataList[x][y + 1]);
  }
  return neighbours;
}

List<List<int>> findNeigbourCoordinates(
    int x, int y, List<List<int>> dataList) {
  var neighbours = <List<int>>[];
  if (x > 0) {
    neighbours.add([x - 1, y]);
  }
  if (x < dataList.length - 1) {
    neighbours.add([x + 1, y]);
  }
  if (y > 0) {
    neighbours.add([x, y - 1]);
  }
  if (y < dataList[x].length - 1) {
    neighbours.add([x, y + 1]);
  }
  return neighbours;
}

int findThreeLargestBassins(List<List<int>> dataList) {
  var bassins = <int>[];
  for (int x = 0; x < dataList.length; x++) {
    for (int y = 0; y < dataList[x].length; y++) {
      var data = dataList[x][y];
      var smallest = true;
      for (int neighbour in findNeigboursFor(x, y, dataList)) {
        if (neighbour <= data) {
          smallest = false;
        }
      }

      if (smallest) {
        bassins.add(getBassinSizeOfThisSmallestPoint(x, y, dataList));
      }
    }
  }

  bassins.sort();
  return bassins[bassins.length - 3] *
      bassins[bassins.length - 2] *
      bassins[bassins.length - 1];
}

int getBassinSizeOfThisSmallestPoint(int x, int y, List<List<int>> dataList) {
  var bassinSize = 1;
  Set<String> coordinatesInBassin = {};
  coordinatesInBassin.add("$x,$y");
  coordinatesInBassin =
      findNewCoordinatesInBassin(x, y, dataList, coordinatesInBassin);

  return coordinatesInBassin.length;
}

Set<String> findNewCoordinatesInBassin(
    int x, int y, List<List<int>> dataList, Set<String> coordinatesInBassin) {
  var result = coordinatesInBassin;
  for (var coordinate in findNeigbourCoordinates(x, y, dataList)) {
    var coordinateX = coordinate[0];
    var coordinateY = coordinate[1];
    if (dataList[coordinateX][coordinateY] != 9) {
      // this belongs to the same basin
      if (result.contains('$coordinateX,$coordinateY')) {
        // we already visited this point
      } else {
        result.add('$coordinateX,$coordinateY');
        result = findNewCoordinatesInBassin(
            coordinate[0], coordinate[1], dataList, result);
      }
    }
  }

  return result;
}
