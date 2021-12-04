// Copyright (c) Erik W. Gren. See LICENSE

import 'dart:math';

import "package:aoc/utils.dart";

List<int> getData(String input) {
  var numbersPattern = RegExp(r"(\d+)", multiLine: true);
  List<int> numbers = numbersPattern.allMatches(input).map((m) => int.parse(m.group(1)!)).toList();
  return numbers;
}

int surface(List<int> d) {
  return 2 * d[0] * d[1] + 2 * d[1] * d[2] + 2 * d[2] * d[0] + min(d[0] * d[1], min(d[1] * d[2], d[2] * d[0]));
}

int ribbon(List<int> d) {
  return min(2 * d[0] + 2 * d[1], min(2 * d[1] + 2 * d[2], 2 * d[2] + 2 * d[0]));
}

int bow(List<int> d) {
  return d[0] * d[1] * d[2];
}

part1(String input) {
  var data = getData(input);

  int score = 0;
  for (int i = 0; i < data.length; i += 3) {
    var current = data.sublist(i, i + 3);
    score += surface(current);
  }

  return score;
}

part2(String input) {
  var data = getData(input);

  int score = 0;
  for (int i = 0; i < data.length; i += 3) {
    var current = data.sublist(i, i + 3);
    score += ribbon(current) + bow(current);
  }

  return score;
}

var today = DateTime(2015, 12, 02);

main(List<String> args) async {
  var input = await fetchInput(today);

  if (!runExamplesPart1(today, part1, args)) return;
  printAnswer(part1(input));

  if (!runExamplesPart2(today, part2, args)) return;
  printAnswer(part2(input));
}
