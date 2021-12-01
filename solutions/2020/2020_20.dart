import "package:aoc/utils.dart";

var emptyLinePatten = RegExp(r"^$", multiLine: true);

class Tile {
  final int id;
  final List<String> top;
  final List<String> bottom;
  final List<String> left;
  final List<String> right;

  const Tile({
    required this.id,
    required this.top,
    required this.bottom,
    required this.left,
    required this.right,
  });

  factory Tile.fromString(String string) {
    var lines = string.split("\n");
    int id = int.parse(lines[0].substring(4, 9));

    return Tile(
        id: id,
        top: lines[1].split(""),
        bottom: lines.last.split(""),
        left: lines.last.split(""),
        right: lines.last.split(""));
  }
}

part1(String input) {
  List<Tile> tiles = [];

  for (var match in input.split(emptyLinePatten)) {
    if (match.isNotEmpty) {
      tiles.add(Tile.fromString(match.trim()));
    }
  }

  for (var tile in tiles) {
    print(tile.id);
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
