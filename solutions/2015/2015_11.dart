// Copyright (c) Erik W. Gren. See LICENSE

import "package:aoc/utils.dart";

List<int> getData(String input) {
  List<int> numbers = input.split("").map((n) => n.codeUnitAt(0) - 97).toList(growable: false);
  return numbers;
}

String dataToString(List<int> data) {
  return String.fromCharCodes(data.map((e) => e + 97));
}

var forbidden = getData("iol").toSet();

var repeatPattern = RegExp(r"((.)\2){1}");

bool isValid(List<int> password) {
  bool onlyAllowed = true;
  for (var digit in password) {
    if (forbidden.contains(digit)) {
      onlyAllowed = false;
      break;
    }
  }
  if (!onlyAllowed) return false;

  bool hasGrowing = false;
  for (int i = 0; i < password.length - 3; i++) {
    if (password[i + 0] + 1 == password[i + 1] && password[i + 1] + 1 == password[i + 2]) {
      hasGrowing = true;
      break;
    }
  }
  if (!hasGrowing) return false;

  bool has2Repeating = repeatPattern.allMatches(dataToString(password)).length >= 2;
  if (!has2Repeating) return false;

  return true;
}

List<int> nextPassword(List<int> password) {
  var result = List.generate(password.length, (index) => password[index], growable: false);

  int i = password.length - 1;
  bool shouldContinue = true;

  while (shouldContinue) {
    shouldContinue = false;
    result[i] = (password[i] + 1) % 26;

    if (i != 0 && result[i] == 0) {
      shouldContinue = true;
    }

    i--;
  }

  return result;
}

part1(String input) {
  var password = getData(input);

  while (!isValid(password)) {
    password = nextPassword(password);
  }

  return dataToString(password);
}

part2(String input) {
  var password = getData(part1(input));

  password = nextPassword(password);
  while (!isValid(password)) {
    password = nextPassword(password);
  }

  return dataToString(password);
}

var today = DateTime(2015, 12, 11);

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
