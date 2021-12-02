
var x, d, a = 0

proc forward(n: int) = x += n; d += a * n
proc down(n: int) = a += n
proc up(n: int) = a -= n

include "../../inputs/2021/auto/2021_02_403677460.txt"

echo "part1: ", x * a, " part2: ", d * x
