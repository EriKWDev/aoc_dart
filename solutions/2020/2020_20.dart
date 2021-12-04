import "package:aoc/utils.dart";

var emptyLinePatten = RegExp(r"^$", multiLine: true);
var numberPattern = RegExp(r"(\d+)");

class Tile {
  final int id;
  final List<String> sides;

  int get hashCode => id;

  Tile({required this.id, required this.sides});

  factory Tile.fromString(String string) {
    var lines = string.split("\n");
    int id = int.parse(numberPattern.firstMatch(lines[0])!.group(1)!);

    StringBuffer left = StringBuffer();
    StringBuffer right = StringBuffer();

    for (int i = 1; i < lines.length; i++) {
      left.write(lines[i][0]);
      right.write(lines[i][lines[i].length - 1]);
    }

    var sides = [lines[1], lines.last, left.toString(), right.toString()];
    sides.addAll(sides.map((e) => reverseString(e)).toList());

    return Tile(id: id, sides: sides);
  }

  @override
  String toString() {
    return id.toString();
  }
}

String reverseString(String s) {
  var length = s.length;
  var charCodes = List.filled(length, 0);
  int i = 0;
  for (var index = length - 1; index >= 0; index--) {
    charCodes[i] = s.codeUnitAt(index);
    i++;
  }

  return new String.fromCharCodes(charCodes);
}

part1(String input) {
  List<Tile> tiles = [];

  for (var match in input.split(emptyLinePatten)) {
    if (match.isNotEmpty) {
      var tile = Tile.fromString(match.trim());

      tiles.add(tile);
    }
  }

  Map<int, Set<String>> neighbours = {};

  for (var tile in tiles) {
    if (!neighbours.containsKey(tile.id)) {
      neighbours[tile.id] = {};
    }
  }

  return 0;
}

part2(String input) {
  return 0;
}

var today = DateTime(2020, 12, 20);

main(List<String> args) async {
  var input = await fetchInput(today);

  if (!runExamplesPart1(today, part1, args)) return;
  printAnswer(part1(input));

  if (!runExamplesPart2(today, part2, args)) return;
  printAnswer(part2(input));
}
