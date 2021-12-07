// Copyright (c) Erik W. Gren. See LICENSE

import "package:aoc/utils.dart";

typedef Data = List<int>;

Data getData(String input) {
  List<int> numbers = input.split(",").map((n) => int.parse(n)).toList();
  return numbers;
}

int calculateFuel2(List<int> positions) {
  int best = 9999999999;
  positions.sort();

  for (int position = 0; position <= positions.last; position++) {
    int score = 0;

    for (int j = 0; j < positions.length; j++) {
      var distance = (position - positions[j]).abs();
      int f = 0;

      for (int i = 1; i <= distance; i++) {
        f += i;
      }

      score += f;
    }

    if (score < best) {
      best = score;
    }
  }

  return best;
}

int calculateFuel1(List<int> positions) {
  int best = 9999999999;
  positions.sort();

  for (int position = 0; position <= positions.last; position++) {
    int score = 0;

    for (int j = 0; j < positions.length; j++) {
      score += (position - positions[j]).abs();
    }

    if (score < best) {
      best = score;
    }
  }

  return best;
}

part1(String input) {
  var data = getData(input);

  return calculateFuel1(data);
}

part2(String input) {
  var data = getData(input);
  return calculateFuel2(data);
}

var today = DateTime(2021, 12, 07);

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
