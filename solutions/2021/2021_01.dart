import "package:aoc/utils.dart";

part1(String input) {
  int score = 0;

  int? previous = null;
  for (var line in input.trim().split("\n")) {
    int value = int.parse(line);
    if (previous != null) {
      if (value > previous) {
        score++;
      }
    }
    previous = value;
  }

  return score;
}

part2(String input) {
  int score = 0;
  var lines = input.trim().split("\n");
  const size = 3;

  int? previous = null;
  for (int i = 0; i <= lines.length - size; i++) {
    int value = 0;

    for (int j = 0; j < size; j++) {
      var line1 = lines[i + j];
      value += int.parse(line1);
    }

    if (previous != null) {
      if (value > previous) {
        score++;
      }
    }
    previous = value;
  }

  return score;
}

var today = DateTime(2021, 12, 01);

main(List<String> args) async {
  var input = await fetchInput(today);

  if (!runExamplesPart1(today, part1, args)) return;
  printAnswer(part1(input));

  if (!runExamplesPart2(today, part2, args)) return;
  printAnswer(part2(input));
}
