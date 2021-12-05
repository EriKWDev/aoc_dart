// Copyright (c) Erik W. Gren. See LICENSE

import "package:aoc/utils.dart";

Map<String, Map<String, int>> getData(String input) {
  Map<String, Map<String, int>> map = {};

  var pattern = RegExp(r"(\w+) to (\w+) = (\d+)", multiLine: true);
  pattern.allMatches(input).forEach((match) {
    var froms = [match.group(1)!, match.group(2)!];
    var tos = [match.group(2)!, match.group(1)!];
    ;
    var value = int.parse(match.group(3)!);

    for (int i = 0; i < froms.length; i++) {
      String from = froms[i];
      String to = tos[i];
      if (!map.containsKey(from)) {
        map[from] = {};
      }

      if (!map[from]!.containsKey(to)) {
        map[from]![to] = 0;
      }

      map[from]![to] = value;
    }
  });
  return map;
}

Set<int> getDistances(Map<String, Map<String, int>> map) {
  Set<int> distances = {};

  for (var perm in permutations(map.keys.toList())) {
    int distance = 0;
    for (int i = 0; i <= perm.length - 2; i++) {
      var location = perm[i];
      var destination = perm[i + 1];

      distance += map[location]![destination]!;
    }

    distances.add(distance);
  }

  return distances;
}

part1(String input) {
  var map = getData(input);

  var distances = getDistances(map);

  var minDistance = 99999999;
  for (var distance in distances) {
    if (distance < minDistance) minDistance = distance;
  }

  return minDistance;
}

part2(String input) {
  var map = getData(input);

  var distances = getDistances(map);

  var maxDistance = -1;
  for (var distance in distances) {
    if (distance > maxDistance) maxDistance = distance;
  }

  return maxDistance;
}

var today = DateTime(2015, 12, 09);

main(List<String> args) async {
  var input = await fetchInput(today);

  if (!runExamplesPart1(today, part1, args)) return;
  var a1 = part1(input);
  printAnswer(a1);
  // await submit1(today, a1, args);

  if (!runExamplesPart2(today, part2, args)) return;
  var a2 = part2(input);
  printAnswer(a2);
  // await submit2(today, a2, args);
}
