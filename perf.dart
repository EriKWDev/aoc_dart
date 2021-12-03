import "dart:io";

Future<void> compileSolution(String path) async {
  var compileProcess = await Process.start("dart", ["compile", "exe", path]);

  await compileProcess.exitCode;
}

class Result extends Object {
  final Duration duration;
  final int times;
  final String path;

  String get name => path.split(Platform.pathSeparator).last.split(".").first;

  const Result({required this.duration, required this.times, required this.path});

  static const prettySeparator = ".";

  String get time => (duration.inMicroseconds / 1000.0).toString();

  @override
  String toString() {
    return "${name.padRight(20, prettySeparator)}${prettySeparator}${time.padLeft(8, prettySeparator)} ms (ran $times times)";
  }
}

Future<Result> measurePerformance(String path) async {
  var done = false;

  int i = 0;

  List<Duration> times = [];

  Duration totalTime = Duration.zero;

  Process? process;

  while (!done) {
    try {
      process = await Process.start(path, ["--performance"]);
      final stopwatch = Stopwatch()..start();
      await process.exitCode;
      stopwatch.stop();

      times.add(stopwatch.elapsed);
      totalTime += stopwatch.elapsed;
      i++;

      if (i >= 100 || totalTime > const Duration(seconds: 25)) {
        done = true;
      }

      await process.kill();
    } on ProcessException catch (e) {
      print(e);
      await process?.kill();
      await Future.delayed(const Duration(milliseconds: 100));
    } finally {
      await Future.delayed(const Duration(milliseconds: 20));
    }
  }

  var averageDuration = Duration(microseconds: times.reduce((value, element) => value + element).inMicroseconds) ~/ i;

  await File(path).delete();
  return Result(duration: averageDuration, times: i, path: path);
}

measurePerformanceForYear(int year) async {
  var aocPattern = RegExp("^((${year})_(\\d+).dart)\$");

  var solutionsDirectory = Directory("${Directory.current.path}${Platform.pathSeparator}solutions");
  List<String> paths = [];

  for (var file in solutionsDirectory.listSync(recursive: true)) {
    var filename = file.path.split(Platform.pathSeparator).last;

    if (aocPattern.hasMatch(filename)) {
      paths.add(file.path);
    }
  }

  if (paths.isEmpty) {
    return;
  }

  await Future.wait(paths.map((path) => compileSolution(path)));
  stdout.writeln();

  List<Future> concurrent = [];
  List<Result> results = [];

  for (var path in paths) {
    stdout.write("Running...\r");

    concurrent.add(measurePerformance(path.split(".")[0] + ".exe").then((value) {
      stdout.write("${value.name}: ${value.time} ms\r");
      results.add(value);
    }));

    if (concurrent.length >= maxConcurrent) {
      await Future.wait(concurrent);
      concurrent.clear();
    }
  }

  await Future.wait(concurrent);
  results.sort((a, b) => a.duration.compareTo(b.duration));

  stdout.writeln("Performance Results for $year");
  for (var result in results) {
    print(result);
  }
}

const maxConcurrent = 5;
const years = [2021, 2020, 2019];

void main() async {
  for (var year in years) {
    await measurePerformanceForYear(year);
  }
}
