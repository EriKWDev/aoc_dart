import "package:aoc/utils.dart";

typedef Coordinates = Map<Coordinate, bool>;

class Coordinate extends Object {
  int x = 0;
  int y = 0;

  static const dirs = {
    "ne": [1, -1],
    "e": [2, 0],
    "se": [1, 1],
    "sw": [-1, 1],
    "w": [-2, 0],
    "nw": [-1, -1],
  };

  void move(String direction) {
    var delta = dirs[direction]!;
    x += delta[0];
    y += delta[1];
  }

  Coordinate getCoordinateMoved(String direction) {
    var c = Coordinate(x, y);
    c.move(direction);
    return c;
  }

  List<Coordinate> getCoordinatesAround() {
    List<Coordinate> result = [];

    for (var dir in dirs.keys) {
      result.add(getCoordinateMoved(dir));
    }

    return result;
  }

  @override
  int get hashCode => x * 1000000 + y;
  @override
  bool operator ==(Object o) => o is Coordinate && o.x == x && o.y == y;

  Coordinate(this.x, this.y);
}

var reg = RegExp("(se|ne|sw|nw|e|w)");

int countBlacks(Coordinates coords) {
  int score = 0;

  for (var entry in coords.entries) {
    // false => black
    if (entry.value == false) {
      score++;
    }
  }

  return score;
}

Iterable<String> parseLine(String line) {
  return reg.allMatches(line).map((match) => match.group(0)!);
}

Coordinates getCoords(String input) {
  Coordinates coords = {};

  for (var line in input.split("\n")) {
    if (line.isEmpty) continue;

    var coord = Coordinate(0, 0);

    for (var dir in parseLine(line)) {
      coord.move(dir);
    }

    if (!coords.containsKey(coord)) {
      coords[coord] = true; // white
    }
    coords[coord] = !coords[coord]!;
  }

  return coords;
}

part1(String input) {
  var coords = getCoords(input);

  return countBlacks(coords);
}

part2(String input) {
  var coords = getCoords(input);

  for (int i = 1; i <= 100; i++) {
    List<Coordinate> toBeTurned = [];
    List<Coordinate> toBeAdded = [];

    for (var coord in coords.keys) {
      var neighbours = coord.getCoordinatesAround();
      for (var neighbour in neighbours) {
        if (!coords.containsKey(neighbour)) {
          toBeAdded.add(neighbour);
        }
      }
    }

    for (var coord in toBeAdded) {
      coords[coord] = true;
    }

    for (var coord in coords.keys) {
      var neighbours = coord.getCoordinatesAround();

      int blacks = 0;

      for (var neighbour in neighbours) {
        if (coords[neighbour] == false) {
          blacks++;
        }
      }

      if (coords[coord] == true) {
        if (blacks == 2) {
          toBeTurned.add(coord);
        }
      } else {
        if (blacks == 0 || blacks > 2) {
          toBeTurned.add(coord);
        }
      }
    }

    for (var coord in toBeTurned) {
      coords[coord] = !coords[coord]!;
    }
  }

  var score = countBlacks(coords);
  return score;
}

var today = DateTime(2020, 12, 24);

main(List<String> args) async {
  var input = await fetchInput(today);

  if (!runExamplesPart1(today, part1, args)) return;
  printAnswer(part1(input));

  if (!runExamplesPart2(today, part2, args)) return;
  printAnswer(part2(input));
}
