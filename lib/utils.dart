import 'dart:convert';
import 'dart:io';
import 'package:html/parser.dart' show parse;

writeAutoInput(String filename, String content, [int? year]) {
  var dir2 = year == null
      ? Directory("${Directory.current.path}/inputs/auto")
      : Directory("${Directory.current.path}/inputs/${year}/auto");

  if (!dir2.existsSync()) {
    dir2.createSync(recursive: true);
  }

  var file2 = File("${dir2.path}/$filename");
  if (!file2.existsSync()) {
    file2.createSync(recursive: true);
  }

  file2.writeAsStringSync(content.trim(), flush: true);
}

String? getAutoInput(String filename, [int? year]) {
  var dir2 = year == null
      ? Directory("${Directory.current.path}/inputs/auto")
      : Directory("${Directory.current.path}/inputs/${year}/auto");

  if (!dir2.existsSync()) {
    dir2.createSync(recursive: true);
  }

  var file2 = File("${dir2.path}/$filename");
  if (!file2.existsSync()) {
    return null;
  }

  return file2.readAsStringSync();
}

File getInputFile(String filename, [int? year]) {
  var dir = year == null
      ? Directory("${Directory.current.path}/inputs")
      : Directory("${Directory.current.path}/inputs/${year}/");

  if (!dir.existsSync()) {
    dir.createSync(recursive: true);
  }

  var file = File("${dir.path}/$filename");

  if (!file.existsSync()) {
    file.createSync(recursive: true);
  }

  return file;
}

String getSession() {
  return Platform.environment["AOC_SESSION"] ?? jsonDecode(File("env.json").readAsStringSync())["sessions"][0]!;
}

String aocFilename(DateTime date, String session) {
  var daySring = date.day.toString().padLeft(2, "0");
  var filename = "${date.year}_${daySring}_${session.hashCode}.txt";

  return filename;
}

Future<void> waitForNow(DateTime date) async {
  var difference = date.difference(DateTime.now().toUtc());

  while (difference > Duration.zero) {
    print("INFO: Waiting ${difference.inSeconds} s for input to open ($difference)");

    var waitTime = const Duration(seconds: 10);

    var updatedDiff = date.difference(DateTime.now().toUtc());

    if (updatedDiff < waitTime) {
      waitTime = updatedDiff;
    }

    if (waitTime <= Duration.zero) break;

    await Future.delayed(waitTime);
    difference -= waitTime;
  }
}

Future<String?> fetchInputFromAOC(DateTime date, String session, [int retries = 0]) async {
  var actualDate = DateTime.fromMicrosecondsSinceEpoch(
      DateTime(date.year, date.month, date.day, 6, 0, 0, 0).microsecondsSinceEpoch,
      isUtc: true);

  var difference = actualDate.difference(DateTime.now().toUtc());

  if (difference > const Duration(days: 1)) {
    print("WARNING: The provided date is too far in the future");
    return null;
  } else {
    await waitForNow(actualDate);
  }

  Future<String?> retry([String? message]) async {
    const n = 4;

    if (retries + 1 <= n) {
      int s = (retries + 1) * 3 + retries;
      print("INFO: Retrying to fetch input in $s s... ${retries + 1}/$n ($message)");
      await Future.delayed(Duration(seconds: s));
      return fetchInputFromAOC(date, session, retries + 1);
    }

    return null;
  }

  var filename = aocFilename(date, session);
  var url = Uri.https("adventofcode.com", "/${date.year}/day/${date.day}/input");
  var request = await HttpClient().getUrl(url);

  request.cookies.add(Cookie("session", session));
  request.followRedirects = true;

  print("INFO: Fetching input");
  var response = await request.close();

  if (response.statusCode.toString()[0] != "2") {
    return retry(response.statusCode.toString());
  }

  var content = await response.transform(utf8.decoder).join();
  var lowerContent = content.toLowerCase();

  if (lowerContent.contains("please don't repeatedly")) {
    return retry(content);
  }

  writeAutoInput(filename, content, date.year);

  print(content);
  print("");

  return content;
}

Future<String> fetchInput(DateTime date, [String? session]) async {
  session ??= getSession();

  String? content;

  content ??= getAutoInput(aocFilename(date, session), date.year);
  content ??= await fetchInputFromAOC(date, session);
  content ??= "";

  return content.trim();
}

typedef Solver = dynamic Function(String input);

class Example {
  final String input;
  final dynamic part1Answer;
  final dynamic part2Answer;

  const Example({required this.input, required this.part1Answer, required this.part2Answer});

  static Example? fromInputFile(File input) {
    var lines = input.readAsLinesSync();

    if (lines.length > 1 && lines[0] != "") {
      dynamic part1 = int.tryParse(lines[0]) ?? lines[0];
      part1 = (part1 == "" || part1 == "null") ? null : part1;
      dynamic part2 = int.tryParse(lines[1]) ?? lines[1];
      part2 = (part2 == "" || part2 == "null") ? null : part2;

      lines.removeRange(0, part2 == null ? 2 : 3);
      var input = lines.join("\n").trim();

      return Example(part1Answer: part1, part2Answer: part2, input: input);
    }

    return null;
  }
}

bool runExamplesPart1(DateTime date, Solver solver, [List<String>? args]) {
  return runExamples(date, solver, 1, args);
}

bool runExamplesPart2(DateTime date, Solver solver, [List<String>? args]) {
  return runExamples(date, solver, 2, args);
}

Map<String, Example> getExamples(DateTime date) {
  var done = false;
  int i = 1;
  Map<String, Example> result = {};

  while (!done) {
    var daySring = date.day.toString().padLeft(2, "0");
    var filename = "${date.year}_${daySring}_$i.txt";

    var file = getInputFile(filename, date.year);
    var example = Example.fromInputFile(file);

    if (example != null) {
      result[filename] = example;
    } else {
      done = false;
      break;
    }

    i++;
  }

  return result;
}

bool isExample = false;

bool runExamples(DateTime date, Solver solver, [int part = 1, List<String>? args]) {
  if (args?.contains("--performance") == true) {
    return true;
  }

  print("\n=== Examples ${date.year} ${date.day.toString().padLeft(2, '0')}, Part $part ===");

  Map<String, Example> examples = getExamples(date);

  int succeeded = 0;
  int skipped = 0;

  for (var entry in examples.entries) {
    isExample = true;
    var filename = entry.key;
    var example = entry.value;

    var input = example.input;

    var skip2 = part == 2 && example.part2Answer == null;
    var skip1 = part == 1 && example.part1Answer == null;

    if (skip2 || skip1) {
      print("$filename, part $part: SKIP: No answer provided in file");
      skipped++;
      continue;
    }

    var value = solver(input);
    var myAnswer = int.tryParse(value.toString()) ?? value;

    if (myAnswer == null) {
      print("$filename, part $part: SKIP: Solution returned null");
      skipped++;
      continue;
    }

    var correctAnswer = part == 1 ? example.part1Answer : example.part2Answer;

    if (myAnswer != correctAnswer) {
      print("$filename, part $part: ERROR: expected $correctAnswer, got $myAnswer");
    } else {
      print("$filename, part $part: OK: $myAnswer");
      succeeded++;
    }

    isExample = false;
  }
  print("\n$succeeded/${examples.length - skipped} Succeeded (Skipped: $skipped)");
  print("================================\n");

  isExample = false;

  return succeeded == examples.length - skipped;
}

void printAnswer(dynamic answer) {
  if (answer != null) {
    print("Answer: $answer");
  }
}

Future<bool> submit1(DateTime date, dynamic answer, [List<String>? args]) async {
  return await submit(date, 1, answer, args);
}

Future<bool> submit2(DateTime date, dynamic answer, [List<String>? args]) async {
  return await submit(date, 2, answer, args);
}

Future<bool> submit(DateTime date, int part, dynamic answer, [List<String>? args]) async {
  if (answer == null) return false;

  print("INFO: Submitting '$answer' for ${date.year} ${date.day.toString().padLeft(2, '0')} part $part...");

  var url = Uri.https("adventofcode.com", "/${date.year}/day/${date.day}/answer");

  var request = await HttpClient().postUrl(url);
  request.headers.set("accept", "application/json");
  request.headers.set("cache-control", "no-cache");
  request.headers.set("content-type", "application/x-www-form-urlencoded");
  request.cookies.add(Cookie("session", getSession()));
  var data = "level=$part&answer=$answer";
  request.write(data);

  var response = await request.close();
  var content = await response.transform(utf8.decoder).join();

  if (response.statusCode.toString()[0] != "2") {
    print(response.statusCode);
    return false;
  }

  var document = parse(content);
  var article = document.getElementsByTagName("article")[0];
  print("");
  print(article.text);

  return true;
}

List<List<T>> permutations<T>(List<T> source) {
  List<List<T>> allPermutations = [];

  permutate<E>(List<E> list, int cursor) {
    if (cursor == list.length) {
      allPermutations.add(list as List<T>);
    }

    for (int i = cursor; i < list.length; i++) {
      List<E> permutation = List.from(list);
      permutation[cursor] = list[i];
      permutation[i] = list[cursor];
      permutate(permutation, cursor + 1);
    }
  }

  permutate<T>(source, 0);

  return allPermutations;
}
