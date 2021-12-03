import 'dart:math';

import "package:aoc/utils.dart";

int calculateFuel(int mass) {
  return (mass ~/ 3) - 2;
}

part1(String input) {
  int score = 0;
  for (var line in input.split("\n")) {
    score += calculateFuel(int.parse(line));
  }
  return score;
}

part2(String input) {
  int score = 0;
  for (var line in input.split("\n")) {
    int fuel = int.parse(line);

    while (fuel > 0) {
      fuel = calculateFuel(fuel);
      score += max(fuel, 0);
    }
  }
  return score;
}

var today = DateTime(2019, 12, 01);

main(List<String> args) async {
  var input = await fetchInput(today);

  if (!runExamplesPart1(today, part1, args)) return;
  printAnswer(part1(input));

  if (!runExamplesPart2(today, part2, args)) return;
  printAnswer(part2(input));
}
