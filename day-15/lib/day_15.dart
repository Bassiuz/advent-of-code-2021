import 'dart:math';

List<List<int>> buildFullMap(List<List<int>> data, int multiplier) {
  var mappedOutData = List<List<int>>.empty(growable: true);
  // set up an empty new grid
  for (var m = 0; m < multiplier; m++) {
    for (var i = 0; i < data.length; i++) {
      mappedOutData.add(List<int>.empty(growable: true));
      for (var n = 0; n < multiplier; n++) {
        for (var j = 0; j < data[i].length; j++) {
          var value = data[i][j] + m + n;
          if (value > 9) {
            value = value - 9;
          }
          mappedOutData[i + data.length * m].add(value);
        }
      }
    }
  }

  return mappedOutData;
}

int shortestRoute(List<List<int>> data) {
  var mappedOutData = List<List<int>>.empty(growable: true);

  // set up an empty new grid
  for (var i = 0; i < data.length; i++) {
    mappedOutData.add(List<int>.empty(growable: true));
    for (var j = 0; j < data[i].length; j++) {
      mappedOutData[i].add(-1);
    }
  }

  mappedOutData[0][0] = 0;

  var refining = true;

  while (refining) {
    var changeMade = false;
    for (var i = 0; i < data.length; i++) {
      for (var j = 0; j < data[i].length; j++) {
        if (i == 0 && j == 0) {
          continue;
        }

        if ((data[i][j] + findLowestNeighbour(mappedOutData, i, j) <
                mappedOutData[i][j]) ||
            mappedOutData[i][j] == -1) {
          mappedOutData[i][j] =
              data[i][j] + findLowestNeighbour(mappedOutData, i, j);
          changeMade = true;
        }
      }
    }
    refining = changeMade;
  }

  return mappedOutData.last.last;
}

List<int> findNeighbours(List<List<int>> mappedOutData, int i, int j) {
  List<int> neighbours = List<int>.empty(growable: true);

  if (i > 0) {
    neighbours.add(mappedOutData[i - 1][j]);
  }

  if (j > 0) {
    neighbours.add(mappedOutData[i][j - 1]);
  }

  if (i < mappedOutData.length - 1) {
    neighbours.add(mappedOutData[i + 1][j]);
  }

  if (j < mappedOutData[i].length - 1) {
    neighbours.add(mappedOutData[i][j + 1]);
  }

  return neighbours.where((e) => e != -1).toList();
}

int findLowestNeighbour(List<List<int>> mappedOutData, int i, int j) {
  var result = findNeighbours(mappedOutData, i, j);
  result.sort();
  return result.first;
}
