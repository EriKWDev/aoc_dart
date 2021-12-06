// Copyright (c) Erik W. Gren. See LICENSE

import 'dart:math';

import "package:aoc/utils.dart";

typedef Data = Map<String, List<int>>;

Data getData(String input) {
  /*
  0: capacity
  1: durability
  2: flavor
  3: texture
  4: calories
  */
  var pattern = RegExp(
      r"(\w+): capacity (-?\d+), durability (-?\d+), flavor (-?\d+), texture (-?\d+), calories (-?\d+)",
      multiLine: true);
  var map = {
    for (var match in pattern.allMatches(input))
      match.group(1)!: match.groups([2, 3, 4, 5, 6]).map((e) => int.parse(e!)).toList()
  };
  return map;
}

int cookieScore(Data map, List<String> ingredients, List<int> amounts, [int? calorieAmount]) {
  if (calorieAmount != null) {
    var calories = 0;
    for (int j = 0; j < ingredients.length; j++) {
      var ingredient = ingredients[j];
      var values = map[ingredient]!;

      calories += amounts[j] * values[4];
    }

    if (calories != calorieAmount) return 0;
  }

  var scores = List.filled(4, 0, growable: false);

  for (int i = 0; i < scores.length; i++) {
    for (int j = 0; j < ingredients.length; j++) {
      var ingredient = ingredients[j];
      var values = map[ingredient]!;

      scores[i] += amounts[j] * values[i];
    }

    scores[i] = max(scores[i], 0);
  }

  var result = scores.reduce((acc, n) => acc *= n);

  return result;
}

Iterable<List<int>> amountsGenerator(int n, [int total = 100]) sync* {
  var start = n == 1 ? total : 0;

  for (int i = start; i <= total; i++) {
    var left = total - i;

    if (n - 1 > 0) {
      for (var values in amountsGenerator(n - 1, left)) {
        yield [i, ...values];
      }
    } else {
      yield [i];
    }
  }
}

part1(String input) {
  var map = getData(input);

  var ingredients = map.keys.toList(growable: false);

  int score = 0;

  for (var amounts in amountsGenerator(ingredients.length)) {
    var newScore = cookieScore(map, ingredients, amounts);

    if (newScore > score) {
      score = newScore;
    }
  }

  return score;
}

part2(String input) {
  var map = getData(input);

  var ingredients = map.keys.toList(growable: false);

  int score = 0;

  for (var amounts in amountsGenerator(ingredients.length)) {
    var newScore = cookieScore(map, ingredients, amounts, 500);

    if (newScore > score) {
      score = newScore;
    }
  }

  return score;
}

var today = DateTime(2015, 12, 15);

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
