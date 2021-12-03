import "package:aoc/utils.dart";

part1(String input) {
  var range = input.split("-").map((e) => int.parse(e)).toList();

  int score = 0;

  for (int password = range[0]; password <= range[1]; password++) {
    int previous = -1;
    bool valid = true;
    String passwordString = password.toString();

    bool hadNeighbours = false;

    for (int digit in passwordString.split("").map((e) => int.parse(e))) {
      if (digit < previous) {
        valid = false;
        break;
      }

      if (digit == previous) {
        hadNeighbours = true;
      }

      previous = digit;
    }

    if (valid && hadNeighbours) {
      score++;
    }
  }

  return score;
}

var repeat1Pattern = RegExp(r"(\d)\1");

bool hasDoubleRepeats(String word) {
  var candidates = repeat1Pattern.allMatches(word);

  for (var candidate in candidates) {
    var n = candidate.group(1);

    var newPattern = RegExp("($n$n+)");

    for (var val in newPattern.allMatches(word)) {
      if (val.group(1)!.length == 2) {
        return true;
      }
    }
  }

  return false;
}

part2(String input) {
  var range = input.split("-").map((e) => int.parse(e)).toList();

  int score = 0;

  for (int password = range[0]; password <= range[1]; password++) {
    String passwordString = password.toString();
    List<int> digits = passwordString.split("").map((e) => int.parse(e)).toList();

    int previous = -1;
    bool valid = true;

    for (int i = 0; i < digits.length; i++) {
      int current = digits[i];
      if (current < previous) {
        valid = false;
        break;
      }
      previous = current;
    }

    if (valid && hasDoubleRepeats(passwordString)) {
      score++;
    }
  }

  return score;
}

var today = DateTime(2019, 12, 04);

main(List<String> args) async {
  var input = await fetchInput(today);

  if (!runExamplesPart1(today, part1, args)) return;
  printAnswer(part1(input));

  if (!runExamplesPart2(today, part2, args)) return;
  printAnswer(part2(input));
}
