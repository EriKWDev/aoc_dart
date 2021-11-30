import "package:aoc/utils.dart";
import "dart:collection";

var splitExpression = RegExp(r"^Player \d+:$", multiLine: true);

int calculateScore(Iterable<int> container) {
  int score = 0;
  int index = container.length;

  for (var item in container) {
    score += item * index;
    index--;
  }

  return score;
}

part1(String input) {
  var player1Deque = ListQueue<int>();
  var player2Deque = ListQueue<int>();

  var inputs = input.trim().split(splitExpression);
  player1Deque.addAll(inputs[1].trim().split("\n").map((e) => int.parse(e)));
  player2Deque.addAll(inputs[2].trim().split("\n").map((e) => int.parse(e)));

  while (player1Deque.isNotEmpty && player2Deque.isNotEmpty) {
    var card1 = player1Deque.removeFirst();
    var card2 = player2Deque.removeFirst();

    if (card1 > card2) {
      player1Deque.addAll([card1, card2]);
    } else {
      player2Deque.addAll([card2, card1]);
    }
  }

  int score = calculateScore(player1Deque.isNotEmpty ? player1Deque : player2Deque);

  return score;
}

Map<int, List<Set<String>>> hands = {};

class Result {
  final int winner;
  final Queue<int> winnerDeque;

  const Result(this.winner, this.winnerDeque);
}

Result playRecursiveGame(Queue<int> player1Deque, Queue<int> player2Deque, [int game = 1]) {
  while (player1Deque.isNotEmpty && player2Deque.isNotEmpty) {
    if (!hands.containsKey(game)) {
      hands[game] = [HashSet(), HashSet()];
    } else {
      if (hands[game]![0].contains(player1Deque.join()) && hands[game]![1].contains(player2Deque.join())) {
        hands.remove(game);
        return Result(1, player1Deque);
      }
    }

    hands[game]![0].add(player1Deque.join());
    hands[game]![1].add(player2Deque.join());

    var card1 = player1Deque.removeFirst();
    var card2 = player2Deque.removeFirst();

    if (player1Deque.length >= card1 && player2Deque.length >= card2) {
      var result = playRecursiveGame(
          ListQueue.from(player1Deque.take(card1)), ListQueue.from(player2Deque.take(card2)), game + 1);
      if (result.winner == 1) {
        player1Deque.addAll([card1, card2]);
      } else {
        player2Deque.addAll([card2, card1]);
      }

      continue;
    }

    if (card1 > card2) {
      player1Deque.addAll([card1, card2]);
    } else {
      player2Deque.addAll([card2, card1]);
    }
  }

  hands.remove(game);
  return player1Deque.isNotEmpty ? Result(1, player1Deque) : Result(2, player2Deque);
}

part2(String input) {
  var player1Deque = ListQueue<int>();
  var player2Deque = ListQueue<int>();

  var inputs = input.trim().split(splitExpression);

  player1Deque.addAll(inputs[1].trim().split("\n").map((e) => int.parse(e)));
  player2Deque.addAll(inputs[2].trim().split("\n").map((e) => int.parse(e)));

  var result = playRecursiveGame(player1Deque, player2Deque);
  int score = calculateScore(result.winnerDeque);

  return score;
}

var today = DateTime(2020, 12, 22);

main() async {
  var input = await fetchInput(today);

  if (!runExamplesPart1(today, part1)) return;
  printAnswer(part1(input));

  if (!runExamplesPart2(today, part2)) return;
  printAnswer(part2(input));
}
