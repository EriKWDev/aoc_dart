// Copyright (c) Erik W. Gren. See LICENSE

import "package:aoc/utils.dart";
import 'dart:convert';
import 'package:crypto/crypto.dart';

String generateMd5(String input) {
  return md5.convert(utf8.encode(input)).toString();
}

part1(String input) {
  int i = 0;
  String current = "potato";

  while (!current.startsWith("00000")) {
    i++;
    current = generateMd5("$input$i");
  }

  return i;
}

part2(String input) {
  int i = part1(input);
  String current = "potato";

  while (!current.startsWith("000000")) {
    i++;
    current = generateMd5("$input$i");
  }

  return i;
}

var today = DateTime(2015, 12, 04);

main(List<String> args) async {
  var input = await fetchInput(today);

  if (!runExamplesPart1(today, part1, args)) return;
  printAnswer(part1(input));

  if (!runExamplesPart2(today, part2, args)) return;
  printAnswer(part2(input));
}
