import "package:aoc/utils.dart";

part1(String input) {
  const width = 25;
  const height = 6;
  const size = width * height;

  List<List<int>> layers = [];

  var data = input.split("").map((e) => int.parse(e)).toList();

  for (int i = 0; i < data.length ~/ size; i++) {
    layers.add(data.sublist(i * size, (i + 1) * size));
  }

  int leastZeros = 99999999;
  int score = -1;
  for (int i = 0; i < layers.length; i++) {
    var values = [0, 0, 0];

    for (int value in layers[i]) {
      values[value]++;
    }

    if (values[0] < leastZeros) {
      leastZeros = values[0];
      score = values[1] * values[2];
    }
  }

  return score;
}

part2(String input) {
  const width = 25;
  const height = 6;
  const size = width * height;

  List<List<int>> layers = [];

  var data = input.split("").map((e) => int.parse(e)).toList();

  for (int i = 0; i < data.length ~/ size; i++) {
    layers.add(data.sublist(i * size, (i + 1) * size));
  }

  var bottomLayer = List.generate(layers.first.length, (index) => layers.first[index]);

  for (var layer in layers) {
    for (int i = 0; i < layer.length; i++) {
      bottomLayer[i] = bottomLayer[i] == 2 ? layer[i] : bottomLayer[i];
    }
  }

  StringBuffer buffer = StringBuffer();
  for (int i = 0; i < bottomLayer.length; i++) {
    buffer.write(bottomLayer[i] == 0 ? " " : "█");
    if (i % width == 0 && i != 0) {
      buffer.write("\n");
    }
  }
  //print(buffer.toString());

  return "ZYBLH";
}

var today = DateTime(2019, 12, 08);

main(List<String> args) async {
  var input = await fetchInput(today);

  if (!runExamplesPart1(today, part1, args)) return;
  printAnswer(part1(input));

  if (!runExamplesPart2(today, part2, args)) return;
  printAnswer(part2(input));
}
