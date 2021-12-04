// Copyright (c) Erik W. Gren. See LICENSE

import 'dart:convert';

import "package:aoc/utils.dart";

List<String> getData(String input) {
  List<String> items = input.split("");
  return items;
}

Map<String, List<int>> deltaMap = {
  "^": [0, 1],
  ">": [1, 0],
  "v": [0, -1],
  "<": [-1, 0]
};

class Position {
  int x = 0;
  int y = 0;
  Position({
    required this.x,
    required this.y,
  });

  Position copyWith({
    int? x,
    int? y,
  }) {
    return Position(
      x: x ?? this.x,
      y: y ?? this.y,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'x': x,
      'y': y,
    };
  }

  factory Position.fromMap(Map<String, dynamic> map) {
    return Position(
      x: map['x'],
      y: map['y'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Position.fromJson(String source) => Position.fromMap(json.decode(source));

  @override
  String toString() => 'Position(x: $x, y: $y)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Position && other.x == x && other.y == y;
  }

  @override
  int get hashCode => x.hashCode ^ y.hashCode;
}

part1(String input) {
  var data = getData(input);

  var pos = Position(x: 0, y: 0);

  Set<Position> positionsVisited = {pos};

  int x = 0;
  int y = 0;

  for (var direction in data) {
    var delta = deltaMap[direction]!;

    x += delta[0];
    y += delta[1];

    positionsVisited.add(Position(x: x, y: y));
  }

  return positionsVisited.length;
}

part2(String input) {
  var data = getData(input);

  var pos = Position(x: 0, y: 0);

  Map<Position, int> positionsVisited = {pos: 1};

  int x1 = 0;
  int y1 = 0;

  int x2 = 0;
  int y2 = 0;

  for (int i = 0; i < data.length; i++) {
    var direction = data[i];

    var delta = deltaMap[direction]!;

    var newPos = Position(x: 0, y: 0);

    if (i % 2 == 0) {
      x1 += delta[0];
      y1 += delta[1];
      newPos = Position(x: x1, y: y1);
    } else {
      x2 += delta[0];
      y2 += delta[1];
      newPos = Position(x: x2, y: y2);
    }

    if (!positionsVisited.containsKey(newPos)) {
      positionsVisited[newPos] = 0;
    }

    positionsVisited[newPos] = positionsVisited[newPos]! + 1;
  }

  int score = 0;
  for (var value in positionsVisited.values) {
    score = value > 0 ? score + 1 : score;
  }

  return score;
}

var today = DateTime(2015, 12, 03);

main(List<String> args) async {
  var input = await fetchInput(today);

  if (!runExamplesPart1(today, part1, args)) return;
  printAnswer(part1(input));

  if (!runExamplesPart2(today, part2, args)) return;
  printAnswer(part2(input));
}
