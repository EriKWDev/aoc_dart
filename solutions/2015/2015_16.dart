// Copyright (c) Erik W. Gren. See LICENSE

import "package:aoc/utils.dart";

typedef Data = Map<String, Set<int>>;

Data getData(String input) {
  var pattern = RegExp(r"^Sue\s+(\d+): (\w+): (\d+), (\w+): (\d+), (\w+): (\d+)", multiLine: true);

  Map<String, Set<int>> map = {};

  for (var match in pattern.allMatches(input)) {
    var keys = {
      "${match.group(2)!}${match.group(3)!}",
      "${match.group(4)!}${match.group(5)!}",
      "${match.group(6)!}${match.group(7)!}",
    };

    int n = int.parse(match.group(1)!);

    for (var key in keys) {
      if (map.containsKey(key)) {
        map[key]!.add(n);
      } else {
        map[key] = {n};
      }
    }
  }
  return map;
}

Set<String> getAnswer1() {
  var input = r"""children: 3
cats: 7
samoyeds: 2
pomeranians: 3
akitas: 0
vizslas: 0
goldfish: 5
trees: 3
cars: 2
perfumes: 1""";

  var pattern = RegExp(r"^(\w+):\D+(\d+)", multiLine: true);

  return {for (var match in pattern.allMatches(input)) "${match.group(1)!}${match.group(2)!}"};
}

Set<String> getAnswer2() {
  var input = r"""children: 3
cats: 8
cats: 9
cats: 10
cats: 11
cats: 12
cats: 13
cats: 14
cats: 15
samoyeds: 2
pomeranians: 2
pomeranians: 1
pomeranians: 0
akitas: 0
vizslas: 0
goldfish: 4
goldfish: 3
goldfish: 2
goldfish: 1
goldfish: 0
trees: 4
trees: 5
trees: 6
trees: 7
trees: 8
trees: 9
trees: 10
trees: 11
trees: 12
trees: 13
trees: 14
trees: 15
trees: 16
cars: 2
perfumes: 1""";

  var pattern = RegExp(r"^(\w+):\D+(\d+)", multiLine: true);

  return {for (var match in pattern.allMatches(input)) "${match.group(1)!}${match.group(2)!}"};
}

part1(String input) {
  var data = getData(input);
  var answer = getAnswer1();
  var maybe = <int>{};

  for (var key in answer) {
    if (!data.containsKey(key)) continue;

    maybe.addAll(data[key]!);
  }

  int score = -1;
  int theAunt = -1;

  for (var aunt in maybe) {
    int local = 0;
    for (var value in answer) {
      if (data[value]?.contains(aunt) == true) {
        local++;
      }
    }

    if (local > score) {
      theAunt = aunt;
      score = local;
    }
  }

  return theAunt;
}

part2(String input) {
  var data = getData(input);
  var answer = getAnswer2();
  var maybe = <int>{};

  for (var key in answer) {
    if (!data.containsKey(key)) continue;

    maybe.addAll(data[key]!);
  }

  int score = -1;
  int theAunt = -1;

  for (var aunt in maybe) {
    int local = 0;
    for (var value in answer) {
      if (data[value]?.contains(aunt) == true) {
        local++;
      }
    }

    if (local > score) {
      theAunt = aunt;
      score = local;
    }
  }

  return theAunt;
}

var today = DateTime(2015, 12, 16);

main(List<String> args) async {
  var input = await fetchInput(today);

  if (!runExamplesPart1(today, part1, args)) return;
  var a1 = part1(input);
  printAnswer(a1);
  await submit1(today, a1, args);

  if (!runExamplesPart2(today, part2, args)) return;
  var a2 = part2(input);
  printAnswer(a2);
  await submit2(today, a2, args);
}
