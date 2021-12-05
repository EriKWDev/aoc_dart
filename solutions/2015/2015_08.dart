// Copyright (c) Erik W. Gren. See LICENSE

import "package:aoc/utils.dart";

List<String> getData(String input) {
  List<String> lines = input.split("\n");
  return lines;
}

var memoryPattern = RegExp(r'\\x[0-9a-f]{2}|\\"|\\\\');

int memoryLength(String word) {
  var strippedWord = word.substring(1, word.length - 1).replaceAll(memoryPattern, "x");

  return strippedWord.length;
}

int codeLength(String word) {
  return word.length;
}

var slashPattern = RegExp(r'[\\"]');

int encodeLength(String word) {
  return "${word.replaceAll(slashPattern, r'xx')}".length + 2;
}

part1(String input) {
  var data = getData(input);
  int score = 0;

  for (var word in data) {
    score += codeLength(word) - memoryLength(word);
  }

  return score;
}

part2(String input) {
  var data = getData(input);
  int score = 0;

  for (var word in data) {
    score += encodeLength(word) - codeLength(word);
  }

  return score;
}

var today = DateTime(2015, 12, 08);

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
