// Copyright (c) Erik W. Gren. See LICENSE

import "package:aoc/utils.dart";

Map<String, Map<String, int>> getData(String input) {
  var pattern = RegExp(r"^(\w+).*(gain|lose)\D+(\d+)\D+to (\w+).$", multiLine: true);

  Map<String, Map<String, int>> map = {};

  map["me"] = {};

  pattern.allMatches(input).forEach((m) {
    var from = m.group(1)!;
    var to = m.group(4)!;

    int value = int.parse(m.group(3)!) * (m.group(2)! == "lose" ? -1 : 1);

    if (!map.containsKey(from)) {
      map[from] = {};
    }

    map[from]![to] = value;
    map[from]!["me"] = 0;
    map["me"]![from] = 0;
  });
  return map;
}

int calculateHappiness(Map<String, Map<String, int>> map, List<String> peopleInOrder) {
  int happiness = map[peopleInOrder.first]![peopleInOrder.last]! + map[peopleInOrder.last]![peopleInOrder.first]!;

  for (int i = 0; i <= peopleInOrder.length - 2; i++) {
    happiness += map[peopleInOrder[i]]![peopleInOrder[i + 1]]! + map[peopleInOrder[i + 1]]![peopleInOrder[i]]!;
  }

  return happiness;
}

part1(String input) {
  var map = getData(input);

  var people = map.keys.toList();
  people.remove("me");

  int maxHappiness = 0;
  for (var perm in permutations(people)) {
    var happiness = calculateHappiness(map, perm);

    if (happiness > maxHappiness) {
      maxHappiness = happiness;
    }
  }

  return maxHappiness;
}

part2(String input) {
  var map = getData(input);

  var people = map.keys.toList();

  int maxHappiness = 0;
  for (var perm in permutations(people)) {
    var happiness = calculateHappiness(map, perm);

    if (happiness > maxHappiness) {
      maxHappiness = happiness;
    }
  }

  return maxHappiness;
}

var today = DateTime(2015, 12, 13);

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
