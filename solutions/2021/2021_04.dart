import "package:aoc/utils.dart";

typedef Board = List<List<int>>;

int calculateBoardScore(Board board, Set<int> playedNumbers, int latestNumber) {
  int sum = 0;

  for (int r = 0; r < board.length; r++) {
    for (int c = 0; c < board[r].length; c++) {
      if (!playedNumbers.contains(board[r][c])) {
        sum += board[r][c];
      }
    }
  }

  return sum * latestNumber;
}

bool hasBoardWon(Board board, Set<int> playedNumbers) {
  for (int r = 0; r < board.length; r++) {
    bool hasWonRow = true;

    for (int c = 0; c < board[r].length; c++) {
      if (!playedNumbers.contains(board[r][c])) {
        hasWonRow = false;
        break;
      }
    }

    if (hasWonRow) {
      return true;
    }
  }

  for (int c = 0; c < board[0].length; c++) {
    bool hasWonCol = true;
    for (int r = 0; r < board.length; r++) {
      if (!playedNumbers.contains(board[r][c])) {
        hasWonCol = false;
        break;
      }
    }

    if (hasWonCol) {
      return true;
    }
  }

  return false;
}

String boardToString(Board board, Set<int> playedNumbers) {
  StringBuffer buffer = StringBuffer();

  for (int r = 0; r < board.length; r++) {
    for (int c = 0; c < board[r].length; c++) {
      if (!playedNumbers.contains(board[r][c])) {
        buffer.write(board[r][c].toString().padLeft(4, " "));
      } else {
        buffer.write("(${board[r][c].toString().padLeft(2)})");
      }
    }
    buffer.write("\n");
  }

  return buffer.toString();
}

var numbersPattern = RegExp(r"(\d+)");

List<Board> getBoards(List<String> lines) {
  List<Board> boards = [];
  bool done = false;

  for (int i = 0; i < lines.length; i++) {
    while (lines[i] != "") {
      i++;
      if (i < lines.length) {
        done = true;
        break;
      }
    }

    if (done) {
      break;
    }

    var board = [
      numbersPattern.allMatches(lines[i + 1]).map((e) => int.parse(e.group(1)!)).toList(),
      numbersPattern.allMatches(lines[i + 2]).map((e) => int.parse(e.group(1)!)).toList(),
      numbersPattern.allMatches(lines[i + 3]).map((e) => int.parse(e.group(1)!)).toList(),
      numbersPattern.allMatches(lines[i + 4]).map((e) => int.parse(e.group(1)!)).toList(),
      numbersPattern.allMatches(lines[i + 5]).map((e) => int.parse(e.group(1)!)).toList()
    ];

    boards.add(board);

    i += 5;
  }

  return boards;
}

part1(String input) {
  var lines = input.split("\n");
  List<int> numbers = lines.first.split(",").map((e) => int.parse(e)).toList();

  lines.removeAt(0);

  List<Board> boards = getBoards(lines);

  Board? winner;
  Set<int> playedNumbers = {};
  int? latestNumber;

  for (var number in numbers) {
    playedNumbers.add(number);
    latestNumber = number;

    for (var board in boards) {
      var won = hasBoardWon(board, playedNumbers);

      if (won) {
        // print(boardToString(board, playedNumbers));
        winner = board;
        break;
      }
    }

    if (winner != null) {
      break;
    }
  }

  if (winner == null) {
    throw UnimplementedError();
  }

  return calculateBoardScore(winner, playedNumbers, latestNumber!);
}

part2(String input) {
  var lines = input.split("\n");
  List<int> numbers = lines.first.split(",").map((e) => int.parse(e)).toList();

  lines.removeAt(0);

  List<Board> boards = getBoards(lines);

  int? latestNumber;
  Set<int> playedNumbers = {};

  for (var number in numbers) {
    playedNumbers.add(number);
    latestNumber = number;

    List<int> winnerIndexes = [];

    for (var n = 0; n < boards.length; n++) {
      var board = boards[n];
      var won = hasBoardWon(board, playedNumbers);

      if (won) winnerIndexes.add(n);
    }

    winnerIndexes.sort((a, b) => b.compareTo(a));

    for (var winnerIndex in winnerIndexes) {
      if (boards.length == 1) {
        return calculateBoardScore(boards[winnerIndex], playedNumbers, latestNumber);
      }

      boards.removeAt(winnerIndex);
    }
  }

  throw UnimplementedError();
}

var today = DateTime(2021, 12, 04);

main(List<String> args) async {
  var input = await fetchInput(today);

  if (!runExamplesPart1(today, part1, args)) return;
  printAnswer(part1(input));

  if (!runExamplesPart2(today, part2, args)) return;
  printAnswer(part2(input));
}
