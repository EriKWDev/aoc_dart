// Copyright (c) Erik W. Gren. See LICENSE

import "dart:math";
import "package:aoc/utils.dart";

class Instruction {
  String kind;
  int fromX;
  int fromY;
  int toX;
  int toY;

  Instruction(this.kind, this.fromX, this.fromY, this.toX, this.toY);
}

List<Instruction> getData(String input) {
  var numbersPattern = RegExp(r"(on|off|toggle)[^\d]+(\d+),(\d+)[^\d]+(\d+),(\d+)$", multiLine: true);

  List<Instruction> numbers = numbersPattern.allMatches(input).map((m) {
    String kind = m.group(1)!;
    int fromX = int.parse(m.group(2)!);
    int fromY = int.parse(m.group(3)!);
    int toX = int.parse(m.group(4)!);
    int toY = int.parse(m.group(5)!);

    // if (isExample) print("${kind}: ${fromX},${fromY} -> ${toX},${toY}");

    return Instruction(kind, fromX, fromY, toX, toY);
  }).toList();
  return numbers;
}

int countLights(List<List<bool>> lights) {
  int score = 0;
  for (var row in lights) {
    for (var light in row) {
      if (light) score++;
    }
  }

  return score;
}

int countLights2(List<List<int>> lights) {
  int score = 0;
  for (var row in lights) {
    for (var light in row) {
      score += light;
    }
  }

  return score;
}

part1(String input) {
  var data = getData(input);

  var lights = List.generate(1000, (index) => List.generate(1000, (index) => false, growable: false), growable: false);

  for (var instruction in data) {
    for (int x = instruction.fromX; x <= instruction.toX; x++) {
      for (int y = instruction.fromY; y <= instruction.toY; y++) {
        lights[y][x] = instruction.kind == "toggle"
            ? !lights[y][x]
            : instruction.kind == "on"
                ? true
                : false;
      }
    }
  }

  return countLights(lights);
}

part2(String input) {
  var data = getData(input);

  var lights = List.generate(1000, (index) => List.generate(1000, (index) => 0, growable: false), growable: false);

  for (var instruction in data) {
    for (int x = instruction.fromX; x <= instruction.toX; x++) {
      for (int y = instruction.fromY; y <= instruction.toY; y++) {
        lights[y][x] = instruction.kind == "toggle"
            ? lights[y][x] + 2
            : instruction.kind == "on"
                ? lights[y][x] + 1
                : max(lights[y][x] - 1, 0);
      }
    }
  }

  return countLights2(lights);
}

var today = DateTime(2015, 12, 06);

main(List<String> args) async {
  var input = await fetchInput(today);

  if (!runExamplesPart1(today, part1, args)) return;
  printAnswer(part1(input));

  if (!runExamplesPart2(today, part2, args)) return;
  printAnswer(part2(input));
}
