// Copyright (c) Erik W. Gren. See LICENSE

import "package:aoc/utils.dart";

typedef Data = List<int>;

Data getData(String input) {
  var numbersPattern = RegExp(r"(-?\d+)", multiLine: true);
  List<int> numbers = numbersPattern.allMatches(input).map((m) => int.parse(m.group(1)!)).toList();
  return numbers;
}

part1(String input) {
  var data = getData(input);
  int score = 0;

  for (var combo in allCombinations(data)) {
    int sum = combo.reduce((acc, n) => acc += n);
    if (sum != 150) continue;

    score++;
  }

  return score;
}

part2(String input) {
  var data = getData(input);

  int score = 0;
  int bestLength = 999999999;

  for (var combo in allCombinations(data)) {
    int sum = combo.reduce((acc, n) => acc += n);
    if (sum != 150) continue;

    if (combo.length < bestLength) {
      bestLength = combo.length;
      score = 0;
    }

    if (combo.length == bestLength) score++;
  }

  return score;
}

var today = DateTime(2015, 12, 17);

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
