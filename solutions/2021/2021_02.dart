import "package:aoc/utils.dart";

var commandPattern = RegExp(r"^(\w).*(\d+)$", multiLine: true);

part1(String input) {
  var commandDelta = {
    "d": [0, 1, 1],
    "u": [0, -1, 1],
    "f": [1, 0, 0]
  };

  int h = 0;
  int d = 0;

  for (var match in commandPattern.allMatches(input.trim())) {
    var command = match.group(1)!;
    var value = int.parse(match.group(2)!);
    var delta = commandDelta[command]!;

    h += delta[0] * value;
    d += delta[1] * value;
  }

  int score = h * d;

  return score;
}

part2(String input) {
  int h = 0;
  int d = 0;
  int aim = 0;

  for (var match in commandPattern.allMatches(input.trim())) {
    var command = match.group(1)!;
    var value = int.parse(match.group(2)!);

    switch (command) {
      case "u":
        aim -= value;
        break;

      case "d":
        aim += value;
        break;

      case "f":
      default:
        h += value;
        d += aim * value;
        break;
    }
  }

  int score = h * d;

  return score;
}

var today = DateTime(2021, 12, 02);

main(List<String> args) async {
  var input = await fetchInput(today);

  if (!runExamplesPart1(today, part1, args)) return;
  printAnswer(part1(input));

  if (!runExamplesPart2(today, part2, args)) return;
  printAnswer(part2(input));
}
