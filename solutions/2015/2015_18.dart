// Copyright (c) Erik W. Gren. See LICENSE

import 'dart:math';

import "package:aoc/utils.dart";

typedef Data = List<List<bool>>;

Data getData(String input) {
  Data values = input
      .split("\n")
      .map((line) => line.split("").map((value) => value == "#" ? true : false).toList(growable: false))
      .toList(growable: false);

  return values;
}

printGrid(Data grid) {
  StringBuffer buffer = StringBuffer();

  for (var row in grid) {
    buffer.writeln(row.map((e) => e == true ? "#" : ".").join(""));
  }

  print(buffer.toString());
}

Data singleRound(Data grid, {bool setCorners = false}) {
  var newGrid = List.generate(grid.length, (x) => List.generate(grid[x].length, (y) => grid[x][y], growable: false),
      growable: false);

  if (setCorners) {
    grid[0][0] = true;
    grid[0][grid[0].length - 1] = true;
    grid[grid.length - 1][0] = true;
    grid[grid.length - 1][grid[0].length - 1] = true;
  }

  for (int x = 0; x < grid.length; x++) {
    for (int y = 0; y < grid[x].length; y++) {
      int neighbours = 0;

      for (int dx = -1; dx <= 1; dx++) {
        if (x + dx < 0 || x + dx >= grid.length) continue;
        for (int dy = -1; dy <= 1; dy++) {
          if (y + dy < 0 || y + dy >= grid[x].length) continue;

          if (dx == 0 && dy == 0) continue;
          if (grid[x + dx][y + dy] == true) neighbours++;
        }
      }

      if (grid[x][y] == true && (neighbours < 2 || neighbours > 3)) {
        newGrid[x][y] = false;
      } else if (neighbours == 3) {
        newGrid[x][y] = true;
      }
    }
  }

  if (setCorners) {
    newGrid[0][0] = true;
    newGrid[0][grid[0].length - 1] = true;
    newGrid[grid.length - 1][0] = true;
    newGrid[grid.length - 1][grid[0].length - 1] = true;
  }

  return newGrid;
}

part1(String input) {
  var grid = getData(input);
  var times = (isExample ? 4 : 100);

  for (int n = 1; n <= times; n++) {
    grid = singleRound(grid);
  }

  var score = 0;

  for (var row in grid) {
    for (var value in row) {
      if (value == true) {
        score++;
      }
    }
  }

  return score;
}

part2(String input) {
  var grid = getData(input);
  var times = (isExample ? 5 : 100);

  for (int n = 1; n <= times; n++) {
    grid = singleRound(grid, setCorners: true);
    // printGrid(grid);
  }

  var score = 0;

  for (var row in grid) {
    for (var value in row) {
      if (value == true) {
        score++;
      }
    }
  }

  return score;
}

var today = DateTime(2015, 12, 18);

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
