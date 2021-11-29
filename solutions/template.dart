import "package:aoc/utils.dart";

part1(String input) {
  return 0;
}

part2(String input) {
  return 0;
}

var today = DateTime(2020, 12, 22);

main() async {
  var input = await fetchInput(today);

  if (!runExamplesPart1(today, part1)) return;
  printAnswer(part1(input));

  if (!runExamplesPart2(today, part2)) return;
  printAnswer(part2(input));
}
