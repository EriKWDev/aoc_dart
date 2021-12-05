// Copyright (c) Erik W. Gren. See LICENSE

import 'dart:convert';
import 'dart:math';

import "package:aoc/utils.dart";

getData(String input) {
  var numbersPattern = RegExp(r"(\d+),(\d+)[^\d]+(\d+),(\d+)", multiLine: true);
  List<List<int>> numbers = numbersPattern.allMatches(input).map((m) {
    return [int.parse(m.group(1)!), int.parse(m.group(2)!), int.parse(m.group(3)!), int.parse(m.group(4)!)];
  }).toList();
  return numbers;
}

part1(String input) {
  var data = getData(input);

  List<List<int>> map = List.generate(1000, (index) => List.generate(1000, (index) => 0));

  for (var combo in data) {
    int x1 = combo[0];
    int y1 = combo[1];

    int x2 = combo[2];
    int y2 = combo[3];

    if (x1 != x2 && y1 != y2) continue;

    int lowerx = min(x1, x2);
    int higherx = max(x1, x2);
    int lowery = min(y1, y2);
    int highery = max(y1, y2);

    for (int x = lowerx; x <= higherx; x++) {
      for (int y = lowery; y <= highery; y++) {
        map[x][y]++;
      }
    }
  }

  int score = 0;
  for (var row in map) {
    for (var value in row) {
      if (value >= 2) score++;
    }
  }

  return score;
}

part2(String input) {
  var data = getData(input);

  const n = 1000;

  List<List<int>> map = List.generate(n, (index) => List.generate(n, (index) => 0, growable: false), growable: false);

  for (var combo in data) {
    int x1 = combo[0];
    int y1 = combo[1];

    int x2 = combo[2];
    int y2 = combo[3];

    var isDiagonal = (x1 != x2 && y1 != y2);
    int dx = (x2 - x1).clamp(-1, 1);
    int dy = (y2 - y1).clamp(-1, 1);

    int i = 0;
    while (true) {
      int x = dx * i + x1;
      int y = dy * i + y1;
      map[y][x]++;

      if ((isDiagonal && (x == x2 || y == y2)) || (x == x2 && y == y2)) break;
      i++;
    }
  }

  int score = 0;
  for (var row in map) {
    for (var value in row) {
      if (value >= 2) score++;
    }
  }

  return score;
}

var today = DateTime(2021, 12, 05);

main(List<String> args) async {
  var input = await fetchInput(today);

  if (!runExamplesPart1(today, part1, args)) return;
  printAnswer(part1(input));

  if (!runExamplesPart2(today, part2, args)) return;
  printAnswer(part2(input));
}
