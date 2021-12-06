// Copyright (c) Erik W. Gren. See LICENSE

import "package:aoc/utils.dart";

typedef Data = Map<String, List<int>>;

Data getData(String input) {
  var pattern = RegExp(r"^(\w+)\D+(-?\d+)\D+(-?\d+)\D+(-?\d+)", multiLine: true);
  var matches = pattern.allMatches(input);
  var map = {
    for (var match in matches)
      match.group(1)!: [
        int.parse(match.group(2)!), //  0: speed
        int.parse(match.group(3)!), //  1: time
        int.parse(match.group(4)!), //  2: timeout
        0, //                           3: distance
        0, //                           4: currentTimeout
      ]
  };

  return map;
}

Data reindeerRound(Data map, [bool last = false]) {
  Data newMap = {};

  for (var key in map.keys) {
    var values = map[key]!;

    if (values[4] - 1 < -values[1]) {
      values[4] = values[2];
    } else if (values[4] <= 0) {
      values[3] += values[0];
    }

    values[4]--;

    newMap[key] = values;
  }

  return newMap;
}

part1(String input) {
  var map = getData(input);

  final roof = (isExample ? 1000 : 2503);
  for (int i = 1; i <= roof; i++) {
    map = reindeerRound(map, i == roof);
  }

  int score = 0;
  for (var values in map.values) {
    if (values[3] > score) {
      score = values[3];
    }
  }

  return score;
}

part2(String input) {
  var map = getData(input);

  final roof = (isExample ? 1000 : 2503);

  var scores = {for (var key in map.keys) key: 0};

  for (int i = 1; i <= roof; i++) {
    map = reindeerRound(map, i == roof);

    int score = 0;
    for (var values in map.values) {
      if (values[3] > score) {
        score = values[3];
      }
    }

    for (var key in map.keys) {
      if (map[key]![3] == score) scores[key] = scores[key]! + 1;
    }
  }

  int score = 0;
  for (var value in scores.values) {
    if (value > score) {
      score = value;
    }
  }

  return score;
}

var today = DateTime(2015, 12, 14);

main(List<String> args) async {
  var input = await fetchInput(today);

  if (!runExamplesPart1(today, part1, args)) return;
  var a1 = part1(input);
  printAnswer(a1);
  // await submit1(today, a1, args);

  if (!runExamplesPart2(today, part2, args)) return;
  var a2 = part2(input);
  printAnswer(a2);
  await submit2(today, a2, args);
}
