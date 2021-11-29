import 'dart:convert';
import 'dart:io';

writeAutoInput(String filename, String content) {
  var dir2 = Directory("${Directory.current.path}/inputs/auto");
  if (!dir2.existsSync()) {
    dir2.createSync();
  }

  var file2 = File("${dir2.path}/$filename");
  if (!file2.existsSync()) {
    file2.createSync();
  }

  file2.writeAsStringSync(content, flush: true);
}

String? getAutoInput(String filename) {
  var dir2 = Directory("${Directory.current.path}/inputs/auto");
  if (!dir2.existsSync()) {
    dir2.createSync(recursive: true);
  }

  var file2 = File("${dir2.path}/$filename");
  if (!file2.existsSync()) {
    return null;
  }

  return file2.readAsStringSync();
}

File getInputFile(String filename) {
  var dir = Directory("${Directory.current.path}/inputs");

  if (!dir.existsSync()) {
    dir.createSync();
  }

  var file = File("${dir.path}/$filename");

  if (!file.existsSync()) {
    file.createSync();
  }

  return file;
}

String getSession() {
  return Platform.environment["AOC_SESSION"] ?? jsonDecode(File("env.json").readAsStringSync())["sessions"][0]!;
}

Future<String> fetchInputFromAOC(DateTime date, String session) async {
  var url = Uri.https("adventofcode.com", "/${date.year}/day/${date.day}/input");

  var request = await HttpClient().getUrl(url);

  request.cookies.add(Cookie("session", session));

  var response = await request.close();
  var content = await response.transform(utf8.decoder).join();

  return content;
}

Future<String> fetchInput(DateTime date, [String? session]) async {
  session ??= getSession();

  var daySring = date.day.toString().padLeft(2, "0");
  var filename = "${date.year}_${daySring}_${session.hashCode}.txt";

  var content = getAutoInput(filename);

  if (content == null) {
    content = await fetchInputFromAOC(date, session);
    writeAutoInput(filename, content);
  }

  return content;
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
      var part1 = int.tryParse(lines[0]) ?? lines[0];
      dynamic part2 = int.tryParse(lines[1]) ?? lines[1];
      part2 = (part2 == "" || part2 == "null") ? null : part2;

      lines.removeRange(0, part2 == null ? 2 : 3);
      var input = lines.join("\n");

      return Example(part1Answer: part1, part2Answer: part2, input: input);
    }

    return null;
  }
}

bool runExamplesPart1(DateTime date, Solver solver) {
  return runExamples(date, solver, 1);
}

bool runExamplesPart2(DateTime date, Solver solver) {
  return runExamples(date, solver, 2);
}

Map<String, Example> getExamples(DateTime date) {
  var done = false;
  int i = 1;
  Map<String, Example> result = {};

  while (!done) {
    var daySring = date.day.toString().padLeft(2, "0");
    var filename = "${date.year}_${daySring}_$i.txt";

    var file = getInputFile(filename);
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

bool runExamples(DateTime date, Solver solver, [int part = 1]) {
  print("=== Examples Part $part ===");

  Map<String, Example> examples = getExamples(date);

  int succeeded = 0;
  int skipped = 0;

  for (var entry in examples.entries) {
    var filename = entry.key;
    var example = entry.value;

    var input = example.input;
    if (part == 2 && example.part2Answer == null) {
      print("$filename, part $part: No answer provided in file. Skipping...");
      skipped++;
      continue;
    }

    // print("---");
    // print(input);
    // print("---");
    var myAnswer = solver(input);

    var correctAnswer = part == 1 ? example.part1Answer : example.part2Answer;

    if (myAnswer != correctAnswer) {
      print("$filename, part $part: ERROR, expected $correctAnswer, got $myAnswer");
    } else {
      print("$filename, part $part: OK ($myAnswer)");
      succeeded++;
    }
  }
  print("\n$succeeded/${examples.length - skipped} Succeeded");
  print("=======================\n");

  return succeeded == examples.length - skipped;
}

void printAnswer(dynamic answer) {
  if (answer != null) {
    print("Answer: $answer\n");
  }
}
