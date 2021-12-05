// Copyright (c) Erik W. Gren. See LICENSE

import "package:aoc/utils.dart";

getData(String input) {
  // List<String> lines = input.split("\n"); return lines;
  // List<String> chunks = input.split("\n\n"); return chunks;
  // List<String> items = input.split(""); return items;
  // List<int> numbers = input.split(",").map((n) => int.parse(n)).toList(); return numbers;
  // var numbersPattern = RegExp(r"(\d+)", multiLine: true); List<int> numbers = numbersPattern.allMatches(input).map((m) => int.parse(m.group(1)!)).toList(); return numbers;
}

part1(String input) {
  var data = getData(input);
  return null;
}

part2(String input) {
  var data = getData(input);
  return null;
}

var today = DateTime(2021, 12, 04);

main(List<String> args) async {
  var input = await fetchInput(today);

  if (!runExamplesPart1(today, part1, args)) return;
  var a1 = part1(input);
  printAnswer(a1);
  await submit1(today, a1, args);

  if (!runExamplesPart2(today, part2, args)) return;
  var a2 = part2(input);
  printAnswer(a2);
  await submit2(today, a2, args);
}
