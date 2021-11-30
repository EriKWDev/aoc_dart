import "package:aoc/utils.dart";

int oneRound(List<int> cups, int currentCup, int largestCup) {
  var first = cups[currentCup];
  var second = cups[cups[currentCup]];
  var third = cups[cups[cups[currentCup]]];

  var destination = currentCup;
  var selectedCups = {currentCup, first, second, third};

  while (selectedCups.contains(destination) || destination <= 0) {
    destination--;

    if (destination <= 0) {
      destination = largestCup;
    }
  }

  cups[currentCup] = cups[third];
  cups[third] = cups[destination];
  cups[destination] = first;

  return cups[currentCup];
}

part1(String input) {
  var data = input.trim().split("").map((e) => int.parse(e)).toList();

  List<int> cups = List.filled(data.length + 1, -1);

  for (int i = 0; i < data.length - 1; i++) {
    cups[data[i]] = data[i + 1];
  }
  cups[data.last] = data.first;

  var largestCup = cups.reduce((value, element) => element > value ? element : value);

  var currentCup = data.first;
  for (int i = 1; i <= 100; i++) {
    currentCup = oneRound(cups, currentCup, largestCup);
  }

  var stringBuffer = StringBuffer();
  var cup = cups[1];
  while (stringBuffer.length < cups.length - 2) {
    stringBuffer.write(cup);
    cup = cups[cup];
  }

  var score = int.parse(stringBuffer.toString());
  return score;
}

part2(String input) {
  var data = input.trim().split("").map((e) => int.parse(e)).toList();
  var largestCup = data.reduce((value, element) => element > value ? element : value);

  for (int i = largestCup + 1; i <= 1000000; i++) {
    data.add(i);
  }

  var cups = List.filled(data.length + 1, -1);

  for (int i = 0; i < data.length - 1; i++) {
    cups[data[i]] = data[i + 1];
  }

  cups[data.last] = data.first;

  largestCup = cups.reduce((value, element) => element > value ? element : value);

  var currentCup = data.first;
  for (int i = 1; i <= 10000000; i++) {
    currentCup = oneRound(cups, currentCup, largestCup);
  }

  var score = cups[1] * cups[cups[1]];

  return score;
}

var today = DateTime(2020, 12, 23);

main(List<String> args) async {
  var input = await fetchInput(today);

  if (!runExamplesPart1(today, part1, args)) return;
  printAnswer(part1(input));

  if (!runExamplesPart2(today, part2, args)) return;
  printAnswer(part2(input));
}
