import "package:test/test.dart";
import "../solutions/2020_24.dart";

main() {
  test("Parse line", () {
    expect(parseLine("nee").toList(), equals(["ne", "e"]));
    expect(parseLine("ene").toList(), equals(["e", "ne"]));
    expect(parseLine("swwwsw").toList(), equals(["sw", "w", "w", "sw"]));
  });

  test("Coordinate move", () {
    var coord1 = Coordinate(0, 0);
    var coord2 = Coordinate(0, 0);

    expect(coord1, equals(coord2));

    coord1.move("sw");
    coord2.move("sw");

    expect(coord1, equals(coord2));

    coord1.move("w");
    coord1.move("se");
    coord1.move("ne");

    expect(coord1, equals(coord2));
  });
}
