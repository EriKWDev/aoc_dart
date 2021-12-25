// Copyright (c) Erik W. Gren. See LICENSE

import 'dart:math';

import "package:aoc/utils.dart";

typedef Data = Map<RegExp, Set<String>>;

Data getData(String input) {
  List<String> chunks = input.split("\n\n");

  var string = chunks[0];
  var pattern = RegExp(r"(\w+) => (\w+)");

  var map = <RegExp, Set<String>>{};

  for (var pair in pattern.allMatches(string)) {
    var value = pair.group(2)!;
    var pattern = RegExp("(${pair.group(1)!})");

    if (!map.containsKey(pattern)) {
      map[pattern] = {value};
    } else {
      map[pattern]!.add(value);
    }
  }

  return map;
}

Data getData2(String input) {
  List<String> chunks = input.split("\n\n");

  var string = chunks[0];
  var pattern = RegExp(r"(\w+) => (\w+)");

  var map = <RegExp, Set<String>>{};

  for (var pair in pattern.allMatches(string)) {
    var value = pair.group(1)!;
    var pattern = RegExp("(${pair.group(2)!})");

    if (!map.containsKey(pattern)) {
      map[pattern] = {value};
    } else {
      map[pattern]!.add(value);
    }
  }

  return map;
}

String getMolecule(String input) {
  List<String> chunks = input.split("\n\n");
  String molecule = chunks[1];

  return molecule;
}

Set<String> getMolecules(Data map, String molecule) {
  var molecules = <String>{};

  for (var pattern in map.keys) {
    for (var value in map[pattern]!) {
      var allMatches = pattern.allMatches(molecule).toList();
      for (int i = 0; i < allMatches.length; i++) {
        var newMolecule = molecule.replaceFirst(pattern, value, allMatches[i].start);
        molecules.add(newMolecule);
      }
    }
  }

  return molecules;
}

part1(String input) {
  var map = getData(input);
  var molecule = getMolecule(input);
  var molecules = getMolecules(map, molecule);

  return molecules.length;
}

int getToGoal(Data map2, String molecule, [String goal = "e"]) {
  final cache = <String, int>{};
  var random = Random();

  int internalGetToGoal(String currentMolecule) {
    if (cache.containsKey(currentMolecule)) return cache[currentMolecule]!;
    // print(currentMolecule);

    if (currentMolecule == goal) return 0;

    int best = 999999;

    var patterns = map2.keys.toList()..shuffle(random);

    for (var pattern in patterns) {
      for (var value in map2[pattern]!) {
        var allMatches = pattern.allMatches(currentMolecule).toList();
        for (int i = 0; i < allMatches.length; i++) {
          var newMolecule = currentMolecule.replaceFirst(pattern, value, allMatches[i].start);
          int score = 1 + internalGetToGoal(newMolecule);

          if (score < best) {
            best = score;
          }
        }
      }
    }

    cache[currentMolecule] = best;

    return best;
  }

  return internalGetToGoal(molecule);
}

part2(String input) {
  var map = getData2(input);
  var molecule = getMolecule(input);

  var score = getToGoal(map, molecule);

  return score;
}

var today = DateTime(2015, 12, 19);

main(List<String> args) async {
  var input = await fetchInput(today);

  if (!runExamplesPart1(today, part1, args)) return;
  var a1 = part1(input);
  printAnswer(a1);
  // await submit1(today, a1, args);

  if (!runExamplesPart2(today, part2, args)) return;
  var a2 = part2(input);
  printAnswer(a2);
  await submit2(today, a2, args);
}
