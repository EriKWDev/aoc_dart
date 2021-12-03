# Advent of Code 2021
All solutions can be found in the `solutions` folder.
## Usage
Don't forget to have `AOC_SESSION=<your_session_token>` loaded into your environment in order to use dynamic loading of input files as well as automatic submission. Alternatively, you can create a `env.json` with the content `{"sessions": ["<your_session_token>"]}`


## Performance
`perf.dart` compiles all solutions to executables, runs them as many times as it can in 20 seconds (or until it has been run 100 times), and takes the average execution time. Remember that every solution runs both part1 and part2, but at least it skips the examples/unit tests since it passes `--performance` as an argument to each executable.

Here are the results, sorted by year and speed:

### `perf.dart`: By compiling and running each solution
#### By year and time
```
Performance Results for 2021
2021_03.................6.494 ms (ran 100 times)
2021_01.................6.821 ms (ran 100 times)
2021_02.................7.866 ms (ran 100 times)

Performance Results for 2020
2020_20..................6.86 ms (ran 100 times)
2020_19.................40.36 ms (ran 100 times)
2020_25.................75.58 ms (ran 100 times)
2020_23...............2175.11 ms (ran 12 times)
2020_24..............2362.493 ms (ran 11 times)

Performance Results for 2019
2019_01.................6.047 ms (ran 100 times)
2019_02................58.886 ms (ran 100 times)
```
### `perf2.dart`: By importing and running part1 and part2 separately
#### By year and time
```
Performance Results for 2021
2021_01 part 1.................0.1119 ms (ran 1000 times)
2021_03 part 2.................0.2179 ms (ran 1000 times)
2021_01 part 2.................0.2181 ms (ran 1000 times)
2021_03 part 1.................0.2877 ms (ran 1000 times)
2021_02 part 2.................0.7025 ms (ran 1000 times)
2021_02 part 1.................0.7151 ms (ran 1000 times)

Performance Results for 2020
2020_20 part 2.................0.0000 ms (ran 1000 times)
2020_25 part 2.................0.0000 ms (ran 1000 times)
2020_23 part 1.................0.0178 ms (ran 1000 times)
2020_20 part 1.................0.5616 ms (ran 1000 times)
2020_19 part 1.................1.8792 ms (ran 1000 times)
2020_19 part 2.................3.0408 ms (ran 1000 times)
2020_24 part 1.................5.8103 ms (ran 861 times)
2020_25 part 1.................58.9771 ms (ran 85 times)
2020_23 part 2.................2206.4427 ms (ran 3 times)
2020_24 part 2.................2328.6220 ms (ran 3 times)

Performance Results for 2019
2019_01 part 1.................0.0074 ms (ran 1000 times)
2019_01 part 2.................0.0095 ms (ran 1000 times)
2019_02 part 1.................0.0165 ms (ran 1000 times)
2019_02 part 2.................42.7350 ms (ran 118 times)
```

#### By date
```
Performance Results for 2021
2021_01 part 1.................0.1110 ms (ran 1000 times)
2021_01 part 2.................0.2180 ms (ran 1000 times)
2021_02 part 1.................0.7150 ms (ran 1000 times)
2021_02 part 2.................0.7020 ms (ran 1000 times)
2021_03 part 1.................0.2870 ms (ran 1000 times)
2021_03 part 2.................0.2170 ms (ran 1000 times)

Performance Results for 2020
2020_19 part 1.................1.8790 ms (ran 1000 times)
2020_19 part 2.................3.0400 ms (ran 1000 times)
2020_20 part 1.................0.5610 ms (ran 1000 times)
2020_20 part 2.................0.0000 ms (ran 1000 times)
2020_23 part 1.................0.0170 ms (ran 1000 times)
2020_23 part 2.................2206.4420 ms (ran 3 times)
2020_24 part 1.................5.8100 ms (ran 861 times)
2020_24 part 2.................2328.6220 ms (ran 3 times)
2020_25 part 1.................58.9770 ms (ran 85 times)
2020_25 part 2.................0.0000 ms (ran 1000 times)

Performance Results for 2019
2019_01 part 1.................0.0070 ms (ran 1000 times)
2019_01 part 2.................0.0090 ms (ran 1000 times)
2019_02 part 1.................0.0160 ms (ran 1000 times)
2019_02 part 2.................42.7350 ms (ran 118 times)

```