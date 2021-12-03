import "package:aoc/utils.dart";

var commandPattern = RegExp(r"([RULD])(\d+)");

Map<String, List<int>> deltaMap = {
  "R": [1, 0],
  "U": [0, 1],
  "L": [-1, 0],
  "D": [0, -1]
};

part1(String input) {
  Map<int, Map<int, Set<int>>> wires = {};

  visit(int wire, int x, int y) {
    if (!wires.containsKey(x)) {
      wires[x] = {};
    }

    if (!wires[x]!.containsKey(y)) {
      wires[x]![y] = {};
    }

    wires[x]![y]!.add(wire);
  }

  var minDistance = 9999999999999999;

  int wire = 0;
  for (var line in input.split("\n")) {
    int x = 0;
    int y = 0;
    wire++;

    for (var match in commandPattern.allMatches(line)) {
      var command = match.group(1)!;
      var amount = int.parse(match.group(2)!);

      var delta = deltaMap[command]!;

      for (int i = 0; i < amount; i++) {
        x += delta[0];
        y += delta[1];

        visit(wire, x, y);
        var visitors = wires[x]![y]!;

        if (visitors.length <= 1) {
          continue;
        }

        var distance = x.abs() + y.abs();
        if (distance < minDistance) {
          minDistance = distance;
        }
      }
    }
  }

  return minDistance;
}

part2(String input) {
  Map<int, Map<int, Map<int, int>>> wires = {};
  int minValue = 9999999999999999;

  visit(int wire, int x, int y, int steps) {
    if (!wires.containsKey(x)) {
      wires[x] = {};
    }

    if (!wires[x]!.containsKey(y)) {
      wires[x]![y] = {};
    }

    if (wires[x]![y]!.containsKey(wire)) {
      return;
    }

    wires[x]![y]![wire] = steps;

    if (wires[x]![y]!.length <= 1) return;

    int total = 0;
    for (int value in wires[x]![y]!.values) {
      total += value;
    }

    if (total < minValue) {
      minValue = total;
    }
  }

  int wire = 0;
  for (var line in input.split("\n")) {
    int x = 0;
    int y = 0;
    int steps = 0;
    wire++;

    for (var match in commandPattern.allMatches(line)) {
      var command = match.group(1)!;
      var amount = int.parse(match.group(2)!);

      var delta = deltaMap[command]!;

      for (int i = 0; i < amount; i++) {
        steps++;
        x += delta[0];
        y += delta[1];

        visit(wire, x, y, steps);
      }
    }
  }

  return minValue;
}

var today = DateTime(2019, 12, 03);

main(List<String> args) async {
  var input = await fetchInput(today);

  if (!runExamplesPart1(today, part1, args)) return;
  printAnswer(part1(input));

  if (!runExamplesPart2(today, part2, args)) return;
  printAnswer(part2(input));
}
