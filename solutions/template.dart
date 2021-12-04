#!/usr/bin/env dart
/*
Copyright (c) Erik W. Gren

List<String> lines = input.split("\n");
List<String> chunks = input.split("\n\n");
List<int> numbers = input.split(",").map((n) => int.parse(n)).toList();

var numbersPattern = RegExp(r"(\d+)", multiLine: true);
List<int> numbers = numbersPattern.allMatches(input).map((m) => int.parse(m.group(1)!)).toList();
*/

import "package:aoc/utils.dart";

part1(String input) {
  return 0;
}

part2(String input) {
  return part1(input);
}

var today = DateTime(2021, 12, 04);

main(List<String> args) async {
  var input = await fetchInput(today);

  if (!runExamplesPart1(today, part1, args)) return;
  printAnswer(part1(input));

  if (!runExamplesPart2(today, part2, args)) return;
  printAnswer(part2(input));
}
