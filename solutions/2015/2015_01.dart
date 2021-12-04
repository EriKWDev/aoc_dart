// Copyright (c) Erik W. Gren. See LICENSE

import "package:aoc/utils.dart";

getData(String input) {
  List<String> items = input.split("");
  return items;
}

part1(String input) {
  var data = getData(input);

  int floor = 0;
  for (var parenthesis in data) {
    if (parenthesis == "(") {
      floor++;
    } else {
      floor--;
    }
  }

  return floor;
}

part2(String input) {
  var data = getData(input);

  int position = 1;
  int floor = 0;
  for (var parenthesis in data) {
    if (parenthesis == "(") {
      floor++;
    } else {
      floor--;
    }

    if (floor < 0) break;

    position++;
  }

  return position;
}

var today = DateTime(2015, 12, 01);

main(List<String> args) async {
  var input = await fetchInput(today);

  if (!runExamplesPart1(today, part1, args)) return;
  printAnswer(part1(input));

  if (!runExamplesPart2(today, part2, args)) return;
  printAnswer(part2(input));
}
