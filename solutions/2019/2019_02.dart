import "package:aoc/utils.dart";

class IntcodeComputer {
  List<int> initialMemory;
  List<int> memory;
  int location;
  int initialLocation;

  IntcodeComputer(this.memory, [this.location = 0])
      : initialMemory = List.generate(memory.length, (index) => memory[index]),
        initialLocation = location;

  factory IntcodeComputer.fromInput(String input, [int location = 0]) {
    var initialMemory = input.split(",").map((e) => int.parse(e)).toList();

    return IntcodeComputer(initialMemory, location);
  }

  Map<int, int> opcodeLengths = {1: 4, 2: 4, 99: 0};

  int get result => memory[0];
  bool halted = false;

  reset() {
    memory = List.generate(initialMemory.length, (index) => initialMemory[index]);
    location = initialLocation;
    halted = false;
  }

  List<int> getParameters(int opcode) {
    List<int> result = [];
    for (int i = 1; i < opcodeLengths[opcode]!; i++) {
      result.add(memory[location + i]);
    }
    return result;
  }

  write(int address, int value) {
    memory[address] = value;
  }

  int read(int address) {
    return memory[address];
  }

  void runOpcode(int opcode, List<int> parameters) {
    switch (opcode) {
      case 1:
        write(parameters[2], read(parameters[0]) + read(parameters[1]));
        break;

      case 2:
        write(parameters[2], read(parameters[0]) * read(parameters[1]));
        break;

      case 99:
        halted = true;
        break;

      default:
        throw UnimplementedError("No implementation found for opcode '$opcode' at location '$location'");
    }
  }

  int run() {
    while (!halted) {
      int opcode = memory[location];
      var parameters = getParameters(opcode);

      runOpcode(opcode, parameters);

      if (!halted) {
        location += opcodeLengths[opcode]!;
      }
    }

    return result;
  }
}

part1(String input) {
  var computer = IntcodeComputer.fromInput(input);

  if (!isExample) {
    computer.memory[1] = 12;
    computer.memory[2] = 2;
  }

  int result = computer.run();

  return result;
}

part2(String input) {
  var computer = IntcodeComputer.fromInput(input);

  for (int noun = 0; noun <= 99; noun++) {
    for (int verb = 0; verb <= 99; verb++) {
      computer.reset();

      computer.memory[1] = noun;
      computer.memory[2] = verb;

      int result = -1;

      try {
        result = computer.run();
      } catch (e) {}

      if (result == 19690720) {
        return 100 * noun + verb;
      }
    }
  }

  throw Exception();
}

var today = DateTime(2019, 12, 02);

main(List<String> args) async {
  var input = await fetchInput(today);

  if (!runExamplesPart1(today, part1, args)) return;
  printAnswer(part1(input));

  if (!runExamplesPart2(today, part2, args)) return;
  printAnswer(part2(input));
}
