#!/usr/bin/env dart

import 'dart:async';
import "./lib/utils.dart";

// 2021
import "./solutions/2021/2021_01.dart" as solution202101;
import "./solutions/2021/2021_02.dart" as solution202102;
import "./solutions/2021/2021_03.dart" as solution202103;
import "./solutions/2021/2021_04.dart" as solution202104;
import "./solutions/2021/2021_05.dart" as solution202105;
import "./solutions/2021/2021_06.dart" as solution202106;

// 2020
import "./solutions/2020/2020_19.dart" as solution202019;
import "./solutions/2020/2020_20.dart" as solution202020;
import "./solutions/2020/2020_23.dart" as solution202023;
import "./solutions/2020/2020_24.dart" as solution202024;
import "./solutions/2020/2020_25.dart" as solution202025;

// 2019
import "./solutions/2019/2019_01.dart" as solution201901;
import "./solutions/2019/2019_02.dart" as solution201902;
import "./solutions/2019/2019_03.dart" as solution201903;
import "./solutions/2019/2019_04.dart" as solution201904;
import "./solutions/2019/2019_08.dart" as solution201908;

// 2015
import "./solutions/2015/2015_01.dart" as solution201501;
import "./solutions/2015/2015_02.dart" as solution201502;
import "./solutions/2015/2015_03.dart" as solution201503;
import "./solutions/2015/2015_04.dart" as solution201504;
import "./solutions/2015/2015_05.dart" as solution201505;
import "./solutions/2015/2015_06.dart" as solution201506;
import "./solutions/2015/2015_07.dart" as solution201507;
import "./solutions/2015/2015_08.dart" as solution201508;
import "./solutions/2015/2015_09.dart" as solution201509;
import "./solutions/2015/2015_10.dart" as solution201510;
import "./solutions/2015/2015_11.dart" as solution201511;
import "./solutions/2015/2015_12.dart" as solution201512;
import "./solutions/2015/2015_13.dart" as solution201513;
import "./solutions/2015/2015_14.dart" as solution201514;
import "./solutions/2015/2015_15.dart" as solution201515;

var allParts = {
  // 2021
  solution202101.today: [solution202101.part1, solution202101.part2],
  solution202102.today: [solution202102.part1, solution202102.part2],
  solution202103.today: [solution202103.part1, solution202103.part2],
  solution202104.today: [solution202104.part1, solution202104.part2],
  solution202105.today: [solution202105.part1, solution202105.part2],
  solution202106.today: [solution202106.part1, solution202106.part2],

  // 2020
  solution202019.today: [solution202019.part1, solution202019.part2],
  solution202020.today: [solution202020.part1, solution202020.part2],
  solution202023.today: [solution202023.part1, solution202023.part2],
  solution202024.today: [solution202024.part1, solution202024.part2],
  solution202025.today: [solution202025.part1, solution202025.part2],

  // 2019
  solution201901.today: [solution201901.part1, solution201901.part2],
  solution201902.today: [solution201902.part1, solution201902.part2],
  solution201903.today: [solution201903.part1, solution201903.part2],
  solution201904.today: [solution201904.part1, solution201904.part2],
  solution201908.today: [solution201908.part1, solution201908.part2],

  // 2015
  solution201501.today: [solution201501.part1, solution201501.part2],
  solution201502.today: [solution201502.part1, solution201502.part2],
  solution201503.today: [solution201503.part1, solution201503.part2],
  solution201504.today: [solution201504.part1, solution201504.part2],
  solution201505.today: [solution201505.part1, solution201505.part2],
  solution201506.today: [solution201506.part1, solution201506.part2],
  solution201507.today: [solution201507.part1, solution201507.part2],
  solution201508.today: [solution201508.part1, solution201508.part2],
  solution201509.today: [solution201509.part1, solution201509.part2],
  solution201510.today: [solution201510.part1, solution201510.part2],
  solution201511.today: [solution201511.part1, solution201511.part2],
  solution201512.today: [solution201512.part1, solution201512.part2],
  solution201513.today: [solution201513.part1, solution201513.part2],
  solution201514.today: [solution201514.part1, solution201514.part2],
  solution201515.today: [solution201515.part1, solution201515.part2],
};

class Result {
  final Duration totalTime;
  final int timesRun;
  final String name;

  Duration get averageTime => Duration(microseconds: totalTime.inMicroseconds ~/ timesRun);

  String get timeString {
    if (averageTime.inMilliseconds > 0) {
      return "${averageTime.inMilliseconds} ms";
    }

    return "${averageTime.inMicroseconds} μs";
  }

  @override
  String toString() {
    return "$name.................${durationToMillisecondString(averageTime)} (ran ${timesRun} times)";
  }

  const Result({required this.totalTime, required this.timesRun, required this.name});
}

class CombinedResult extends Result {
  Result result1;
  Result result2;

  @override
  Duration get averageTime => result1.averageTime + result2.averageTime;

  CombinedResult(this.result1, this.result2, String name)
      : super(
            name: name,
            totalTime: result1.totalTime + result2.totalTime,
            timesRun: result1.timesRun + result2.timesRun);

  static Future<CombinedResult> fromFutures(Future<Result> r1, Future<Result> r2, String name) async {
    return CombinedResult(await r1, await r2, name);
  }

  @override
  String toString() {
    var result = "$name.................${durationToMillisecondString(averageTime)}";

    result += "\n  $result1";
    result += "\n  $result2";

    return result;
  }
}

typedef Part = dynamic Function(String input);

String durationToMillisecondString(Duration duration) {
  var avgMilliseconds = duration.inMicroseconds.toDouble() / 1000.0;
  var ms = avgMilliseconds.toStringAsFixed(4);

  return "$ms ms";
}

Future<Result> measurePart(Part part, String input, String name) async {
  var done = false;

  Duration totalTime = Duration.zero;

  int n = 0;
  print("Measuring $name...");

  while (!done) {
    var stopWatch = Stopwatch()..start();
    var answer = part(input);
    stopWatch.stop();
    // print("Answer: $answer ($done)");

    await Future.delayed(Duration.zero);

    totalTime += stopWatch.elapsed;
    n++;

    if (totalTime > Duration(seconds: 5) || n >= 1000) {
      done = true;
    }
  }

  var result = Result(timesRun: n, totalTime: totalTime, name: name);
  print("Done measuring $name (${result.averageTime})");

  return result;
}

void main(List<String> args) async {
  List<Future<CombinedResult>> results = [];
  List<Future<Result>> partResults = [];
  List<Future<Result>> concurrent = [];

  for (var entry in allParts.entries) {
    var parts = entry.value;
    var date = entry.key;
    var name = "${date.year}_${date.day.toString().padLeft(2, '0')}";

    var input = await fetchInput(date);
    var r1 = measurePart(parts[0], input, "$name part 1");
    var r2 = measurePart(parts[1], input, "$name part 2");

    partResults.addAll([r1, r2]);

    var combinedFuture = CombinedResult.fromFutures(r1, r2, name);
    results.add(combinedFuture);
    concurrent.addAll([r1, r2]);

    if (concurrent.length > 2) {
      await Future.any(concurrent);
      concurrent.clear();
    }
  }

  List<CombinedResult> awaitedResults = [];
  for (var result in results) {
    awaitedResults.add(await result);
  }

  awaitedResults.sort((a, b) => a.name.compareTo(b.name));

  Map<String, List<Result>> partResultsByYear = {};

  List<Result> awaitedPartResults = [];
  for (var result in partResults) {
    var r = await result;
    awaitedPartResults.add(r);

    var key = r.name.split("_")[0];

    if (!partResultsByYear.containsKey(key)) {
      partResultsByYear[key] = [];
    }

    partResultsByYear[key]!.add(r);
  }

  awaitedPartResults.sort((a, b) => a.averageTime.compareTo(b.averageTime));

  for (var result in awaitedPartResults) {
    var avgMilliseconds = result.totalTime.inMicroseconds.toDouble() / result.timesRun.toDouble() / 1000.0;
    var ms = avgMilliseconds.toStringAsFixed(4);

    print("${result.name}.................$ms ms");
  }
  print("");

  print("By speed\n");

  for (var entry in partResultsByYear.entries) {
    var results = entry.value;
    results.sort((a, b) => a.averageTime.compareTo(b.averageTime));
    print("Performance Results for ${entry.key}");

    for (var result in results) {
      print(result);
    }
    print("");
  }

  print("By date\n");

  for (var entry in partResultsByYear.entries) {
    var results = entry.value;
    results.sort((a, b) => a.name.compareTo(b.name));
    print("Performance Results for ${entry.key}");

    for (var result in results) {
      print(result);
    }
    print("");
  }
}
