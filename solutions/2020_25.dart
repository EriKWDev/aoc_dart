import "package:aoc/utils.dart";

const secretPrime = 20201227;

int transform(value, subject) {
  return (value * subject) % secretPrime;
}

part1(String input) {
  var data = input.trim().split("\n").map((e) => int.tryParse(e)!).toList();
  int cardPublicKey = data[0];
  int doorPublicKey = data[1];

  int loopSize = 0;
  int result = 1;

  while (result != cardPublicKey) {
    loopSize++;
    result = transform(result, 7);
  }

  var encryptionKey = BigInt.from(doorPublicKey).modPow(BigInt.from(loopSize), BigInt.from(secretPrime));

  return encryptionKey;
}

part2(String input) {
  return 0;
}

var today = DateTime(2020, 12, 25);

main() async {
  var input = await fetchInput(today);

  if (!runExamplesPart1(today, part1)) return;
  printAnswer(part1(input));

  if (!runExamplesPart2(today, part2)) return;
  printAnswer(part2(input));
}
