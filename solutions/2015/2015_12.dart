// Copyright (c) Erik W. Gren. See LICENSE

import 'dart:convert';
import "package:aoc/utils.dart";

List<int> getData(String input) {
  var numbersPattern = RegExp(r"(-?\d+)", multiLine: true);
  List<int> numbers = numbersPattern.allMatches(input).map((m) => int.parse(m.group(1)!)).toList();
  return numbers;
}

part1(String input) {
  var numbers = getData(input);

  int sum = 0;
  for (var number in numbers) {
    sum += number;
  }
  return sum;
}

int countNumbers2(dynamic data) {
  if (data is String) {
    return 0;
  }

  if (data is int) {
    return data;
  }

  int score = 0;

  if (data is Map) {
    if (data.containsValue("red")) {
      return 0;
    } else {
      for (var value in data.values) {
        score += countNumbers2(value);
      }
    }
  }

  if (data is List) {
    for (var value in data) {
      score += countNumbers2(value);
    }

    return score;
  }

  if (data is Map<String, dynamic>) {}

  return score;
}

part2(String input) {
  dynamic data = jsonDecode(input);

  int score = countNumbers2(data);

  return score;
}

var today = DateTime(2015, 12, 12);

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
