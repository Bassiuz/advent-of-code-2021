import "dart:math";

int countEntrantsAfterFolds(
    List<String> instructions, List<List<int>> coordinates) {
  for (String instruction in instructions) {
    coordinates = performInstrctions(instruction, coordinates);
  }

  return coordinates.length;
}

void printMessageAfterFolds(
    List<String> instructions, List<List<int>> coordinates) {
  for (String instruction in instructions) {
    coordinates = performInstrctions(instruction, coordinates);
  }
  var maxX = coordinates.map((e) => e[0]).reduce(max);
  var maxY = coordinates.map((e) => e[1]).reduce(max);

  for (int y = 0; y <= maxY; y++) {
    var line = '';
    for (int x = 0; x <= maxX; x++) {
      if (coordnateIsInList(<int>[x, y], coordinates)) {
        line = line + '#';
      } else {
        line = line + '.';
      }
    }
    print(line);
  }
}

List<List<int>> removeDuplicates(List<List<int>> coordinates) {
  var newCoordinates = <List<int>>[];
  for (List<int> coordinate in coordinates) {
    if (!coordnateIsInList(coordinate, newCoordinates)) {
      newCoordinates.add(coordinate);
    }
  }
  return newCoordinates;
}

bool coordnateIsInList(List<int> coordinate, List<List<int>> coordinates) {
  for (var coord in coordinates) {
    if (coord[0] == coordinate[0] && coord[1] == coordinate[1]) {
      return true;
    }
  }
  return false;
}

List<List<int>> performInstrctions(
    String instruction, List<List<int>> coordinates) {
  var instructionAxis = instruction.split(' ')[2].split('=')[0];
  var instructionAxisCount = int.parse(instruction.split(' ')[2].split('=')[1]);

  var arrayPosition = instructionAxis == 'x' ? 0 : 1;

  var newCoordinates = <List<int>>[];
  for (List<int> coordinate in coordinates) {
    if (coordinate[arrayPosition] > instructionAxisCount) {
      // we need to flip the coordinate.
      coordinate[arrayPosition] = instructionAxisCount -
          (coordinate[arrayPosition] - instructionAxisCount);
    }
    if (!coordnateIsInList(coordinate, newCoordinates)) {
      newCoordinates.add(coordinate);
    }
  }
  return newCoordinates;
}
