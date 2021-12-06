// Copyright (c) Erik W. Gren. See LICENSE
import "package:aoc/utils.dart";

List<int> getData(String input) {
  List<int> numbers = input.split(",").map((n) => int.parse(n)).toList();
  return numbers;
}

List<int> lanternRound(List<int> state) {
  int toBeAdded = 0;

  var result = List.generate(state.length, (index) {
    var res = state[index] - 1;

    if (res <= -1) {
      toBeAdded++;
      res = 6;
    }

    return res;
  });

  result.addAll(List.filled(toBeAdded, 8));

  return result;
}

part1(String input) {
  var state = getData(input);

  for (int i = 1; i <= 80; i++) {
    state = lanternRound(state);
  }

  return state.length;
}

part2(String input) {
  var state = getData(input);

  const n = 9;

  var map = List.filled(n, 0, growable: false);
  for (var value in state) {
    map[value]++;
  }

  for (int i = 1; i <= 256; i++) {
    final newMap = List.filled(n, 0, growable: false);

    for (int i = 0; i < n; i++) {
      newMap[i] = map[(i + 1) % n];
    }
    newMap[6] += map[0];
    map = newMap;
  }

  int score = 0;
  for (var value in map) {
    score += value;
  }

  return score;
}

var today = DateTime(2021, 12, 06);

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
