// Copyright (c) Erik W. Gren. See LICENSE

import "package:aoc/utils.dart";

Map<String, List<String>> getData(String input) {
  List<String> lines = input.split("\n");

  Map<String, List<String>> memory = {};

  for (var line in lines) {
    var match = instructionPattern.firstMatch(line)!;

    var leftValues = match.group(1)!.split(" ");
    var right = match.group(2)!;

    memory[right] = leftValues;
  }

  return memory;
}

var instructionPattern = RegExp(r"(.*) -> (.*)");

typedef Operation = int Function([int? a, int? b]);

Map<String, Operation> operationMap = {
  "AND": ([a, b]) => a! & b!,
  "OR": ([a, b]) => a! | b!,
  "NOT": ([a, b]) => ~a!,
  "RSHIFT": ([a, b]) => a! >> b!,
  "LSHIFT": ([a, b]) => a! << b!,
};

int getValue(Map<String, List<String>> data, dynamic name, [Map<String, int>? results]) {
  if (name is int) return name;

  String key = name as String;

  results ??= {};

  var value = int.tryParse(key);
  if (value != null) return value;

  if (!results.containsKey(key)) {
    var values = data[key]!;

    int? result;

    if (values.length == 1) {
      result = getValue(data, values[0], results);
    } else if (values.length == 2) {
      result = operationMap[values[0]]!(getValue(data, values[1], results));
    } else if (values.length == 3) {
      result = operationMap[values[1]]!(getValue(data, values[0], results), getValue(data, values[2], results));
    }

    results[key] = result!;
  }

  return results[key]!;
}

part1(String input) {
  var data = getData(input);

  return getValue(data, "a");
}

part2(String input) {
  var data = getData(input);

  var ogA = data["a"]!;
  var value = getValue(data, "a");
  data["b"] = [value.toString()];
  data["a"] = ogA;

  return getValue(data, "a");
}

var today = DateTime(2015, 12, 07);

main(List<String> args) async {
  var input = await fetchInput(today);

  if (!runExamplesPart1(today, part1, args)) return;
  printAnswer(part1(input));

  if (!runExamplesPart2(today, part2, args)) return;
  printAnswer(part2(input));
}
