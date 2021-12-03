import "package:aoc/utils.dart";

List<String> findMostLeastCommon(List<String> numbers, [int pos = 0]) {
  var mostCommonDigit = "";
  var leastCommonDigit = "";

  int ones = 0;
  int zeros = 0;

  for (var line in numbers) {
    if (line[pos] == "0") {
      zeros++;
    } else {
      ones++;
    }
  }

  if (ones >= zeros) {
    mostCommonDigit = "1";
    leastCommonDigit = "0";
  } else {
    mostCommonDigit = "0";
    leastCommonDigit = "1";
  }

  return [mostCommonDigit, leastCommonDigit];
}

part1(String input) {
  var data = input.trim().split("\n");

  String gamma = "";
  String epsilon = "";

  for (int i = 0; i < data[0].length; i++) {
    var result = findMostLeastCommon(data, i);
    gamma += result[0];
    epsilon += result[1];
  }

  var score = int.parse(epsilon, radix: 2) * int.parse(gamma, radix: 2);

  return score;
}

String findPart2NumbersRecursively(List<String> numbers, [bool mostCommon = true, int pos = 0]) {
  if (numbers.length <= 1) {
    return numbers.first;
  }

  var result = findMostLeastCommon(numbers, pos);

  var searchingFor = mostCommon ? result[0] : result[1];

  List<String> newNumbers = [];
  for (var line in numbers) {
    if (line[pos] == searchingFor) {
      newNumbers.add(line);
    }
  }

  return findPart2NumbersRecursively(newNumbers, mostCommon, pos + 1);
}

part2(String input) {
  var numbers = input.trim().split("\n");

  String oxygenRating = findPart2NumbersRecursively(numbers, true);
  String co2Rating = findPart2NumbersRecursively(numbers, false);

  var score = int.parse(oxygenRating, radix: 2) * int.parse(co2Rating, radix: 2);

  return score;
}

var today = DateTime(2021, 12, 03);

main(List<String> args) async {
  var input = await fetchInput(today);

  if (!runExamplesPart1(today, part1, args)) return;
  printAnswer(part1(input));

  if (!runExamplesPart2(today, part2, args)) return;
  printAnswer(part2(input));
}
