// Copyright (c) Erik W. Gren. See LICENSE

import "package:aoc/utils.dart";

List<String> getData(String input) {
  List<String> lines = input.split("\n");
  return lines;
}

var vowelPattern = RegExp(r"([aeiou])");
var repeatPattern = RegExp(r"(.)\1{1,}");
var forbiddenPattern = RegExp(r"(ab)|(cd)|(pq)|(xy)");

bool isNice(String word) {
  if (forbiddenPattern.allMatches(word).isNotEmpty) return false;
  if (vowelPattern.allMatches(word).length < 3) return false;
  if (repeatPattern.allMatches(word).isEmpty) return false;

  return true;
}

part1(String input) {
  var data = getData(input);

  int score = 0;
  for (var word in data) {
    if (isNice(word)) score++;
  }
  return score;
}

var repeatAfterOnePattern = RegExp(r"(.)\w{1}\1{1}");
var repeatingGroupsPattern = RegExp(r"(.)([^\1])([^\1\2]+)?\1\2");

bool isNice2(String word) {
  if (repeatAfterOnePattern.allMatches(word).isEmpty) return false;
  if (repeatingGroupsPattern.allMatches(word).isEmpty) return false;

  return true;
}

part2(String input) {
  var data = getData(input);

  int score = 0;
  for (var word in data) {
    if (isNice2(word)) score++;
  }
  return score;
}

var today = DateTime(2015, 12, 05);

main(List<String> args) async {
  var input = await fetchInput(today);

  if (!runExamplesPart1(today, part1, args)) return;
  printAnswer(part1(input));

  if (!runExamplesPart2(today, part2, args)) return;
  printAnswer(part2(input));
}
