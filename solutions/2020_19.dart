import "package:aoc/utils.dart";

Map<int, List<String>> rules = {};

var ruleExpression = RegExp(r"(\d+): (.*)", multiLine: true);
var wordsExpression = RegExp(r"^(\w+)$", multiLine: true);

Map<int, StringBuffer> cache = {};
StringBuffer build(int ruleNumber, [clearCache = true]) {
  if (clearCache) cache.clear();

  if (cache.containsKey(ruleNumber)) return cache[ruleNumber]!;

  StringBuffer stringBuffer = StringBuffer("(?:");

  var rule = rules[ruleNumber]!;

  for (String value in rule) {
    var maybeInt = int.tryParse(value);
    if (maybeInt != null) {
      stringBuffer.write(build(maybeInt, false));
    } else {
      stringBuffer.write(value);
    }
  }

  stringBuffer.write(")");

  cache[ruleNumber] = stringBuffer;
  return cache[ruleNumber]!;
}

part1(String input) {
  rules.clear();
  var ruleMatches = ruleExpression.allMatches(input.trim());

  for (var ruleMatch in ruleMatches) {
    var ruleIndex = int.parse(ruleMatch.group(1)!);
    var newRules = ruleMatch.group(2)!.replaceAll("\"", "").split(' ');
    rules[ruleIndex] = newRules;
    // print(newRules);
  }

  var regexString = build(0).toString();
  var validExpression = RegExp("^${regexString}\$");
  int score = 0;

  for (var wordMatch in wordsExpression.allMatches(input.trim())) {
    var word = wordMatch.group(1)!;

    if (validExpression.hasMatch(word)) {
      score++;
    }
  }

  return score;
}

part2(String input) {
  rules.clear();
  var ruleMatches = ruleExpression.allMatches(input.trim());

  for (var ruleMatch in ruleMatches) {
    var ruleIndex = int.parse(ruleMatch.group(1)!);
    var newRules = ruleMatch.group(2)!.replaceAll("\"", "").split(' ');
    rules[ruleIndex] = newRules;
  }

  rules[8] = ["42", "+"];
  rules[11] =
      "42 ( 42 ( 42 ( 42 ( 42 ( 42 ( 42 ( 42 ( 42 ( 42 ( 42 31 )? 31 )? 31 )? 31 )? 31 )? 31 )? 31 )? 31 )? 31 )? 31 )? 31"
          .split(" "); // not proud

  var regexString = build(0).toString();
  var validExpression = RegExp("^${regexString}\$");
  int score = 0;

  for (var wordMatch in wordsExpression.allMatches(input.trim())) {
    var word = wordMatch.group(1)!;

    if (validExpression.hasMatch(word)) {
      score++;
    } else {}
  }

  return score;
}

var today = DateTime(2020, 12, 19);

main() async {
  var input = await fetchInput(today);

  if (!runExamplesPart1(today, part1)) return;
  printAnswer(part1(input));

  if (!runExamplesPart2(today, part2)) return;
  printAnswer(part2(input));
}
