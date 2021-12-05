// Copyright (c) Erik W. Gren. See LICENSE

import "package:aoc/utils.dart";

List<int> getData(String input) {
  var numbersPattern = RegExp(r"(\d)", multiLine: true);
  List<int> numbers = numbersPattern.allMatches(input).map((m) => int.parse(m.group(1)!)).toList();
  return numbers;
}

List<int> lookAndSay(List<int> numbers) {
  List<int> result = [];

  int i = 0;
  while (i < numbers.length) {
    int n = 1;

    while (i + n < numbers.length && numbers[i + n] == numbers[i]) {
      n++;
    }

    result.addAll([n, numbers[i]]);

    i += n;
  }

  return result;
}

part1(String input) {
  var data = getData(input);

  for (int i = 1; i <= (isExample ? 1 : 40); i++) {
    data = lookAndSay(data);
  }

  if (isExample) return data.join();

  return data.length;
}

part2(String input) {
  var data = getData(input);

  for (int i = 1; i <= 50; i++) {
    data = lookAndSay(data);
  }

  return data.length;
}

var today = DateTime(2015, 12, 10);

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
