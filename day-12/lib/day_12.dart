int countTotalPossiblePaths(List<String> data) {
  return countTotalPathsFromPointWithData('start', data, '');
}

int countTotalPossiblePathsWhileTravelingSmallCavesTwice(List<String> data) {
  return countTotalPathsFromPointWithDataWhileTravelingSmallCavesTwice(
      'start', data, '', false);
}

int countTotalPathsFromPointWithData(
    String point, List<String> routeList, String currentRoute) {
  int totalPaths = 0;

  currentRoute = currentRoute + point + '-';
  var data = routeList.map((element) => element).toList();
  var travalableRoutes = <String>[];
  for (var route in data) {
    if (routeContainsPoint(route, point)) {
      // travel over this route
      travalableRoutes.add(route);
    }
  }

  for (var route in travalableRoutes) {
    // get the next point
    var nextPoint = route.split('-')[1] == point
        ? route.split('-')[0]
        : route.split('-')[1];

    if (point[0].toUpperCase() != point[0]) {
      // this is a lower case letter, so this is a path to a small cave. Remove all routes that contain this point
      data.removeWhere((element) => element.contains(point));
    }

    // close loop if next point is 'end'
    if (nextPoint == 'end') {
      totalPaths++;
    } else {
      totalPaths +=
          countTotalPathsFromPointWithData(nextPoint, data, currentRoute);
    }
  }

  return totalPaths;
}

int countTotalPathsFromPointWithDataWhileTravelingSmallCavesTwice(String point,
    List<String> routeList, String currentRoute, bool smallCaveIsVisitedTwice) {
  int totalPaths = 0;

  currentRoute = currentRoute + point + '-';
  var data = routeList.map((element) => element).toList();
  var travalableRoutes = <String>[];

  for (var route in data) {
    if (routeContainsPoint(route, point)) {
      // travel over this route
      travalableRoutes.add(route);
    }
  }

  for (var route in travalableRoutes) {
    // get the next point
    var nextPoint = route.split('-')[1] == point
        ? route.split('-')[0]
        : route.split('-')[1];

    if (point[0].toUpperCase() != point[0]) {
      // this is a lower case letter, so this is a path to a small cave. Remove all routes that contain this point
      if (smallCaveIsVisitedTwice || route.contains('start')) {
        data.removeWhere((element) => element.contains(point));
      } else {
        if (countPointInRoute(currentRoute, point) == 2) {
          // this is where we move to a small cave for a second time
          smallCaveIsVisitedTwice = true;
          // remove all routes with small caves that we visited before
          data = removeAlreadyVisitedSmallCaves(data, currentRoute);
        }
      }
    }

    // close loop if next point is 'end'
    if (nextPoint == 'end') {
      totalPaths++;
    } else {
      totalPaths +=
          countTotalPathsFromPointWithDataWhileTravelingSmallCavesTwice(
              nextPoint, data, currentRoute, smallCaveIsVisitedTwice);
    }
  }

  return totalPaths;
}

List<String> removeAlreadyVisitedSmallCaves(
    List<String> data, String currentRoute) {
  var toBeRemovedRoutes = <String>[];
  for (var routepoint in currentRoute.split('-')) {
    if (routepoint.toUpperCase() != routepoint) {
      for (var route in data) {
        if (routeContainsPoint(route, routepoint)) {
          toBeRemovedRoutes.add(route);
        }
      }
    }
  }

  for (var route in toBeRemovedRoutes) {
    data.remove(route);
  }

  return data;
}

bool routeContainsPoint(String route, String point) {
  return countPointInRoute(route, point) > 0;
}

int countPointInRoute(String route, String point) {
  var count = 0;
  for (var routepoint in route.split('-')) {
    if (routepoint == point) {
      count++;
    }
  }
  return count;
}
