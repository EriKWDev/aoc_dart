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
2021_01..................6.57 ms (ran 100 times)
2021_03.................6.886 ms (ran 100 times)
2021_02.................8.134 ms (ran 100 times)

Performance Results for 2020
2020_20.................7.333 ms (ran 100 times)
2020_19................41.768 ms (ran 100 times)
2020_25................76.218 ms (ran 100 times)
2020_23..............2239.928 ms (ran 12 times)
2020_24..............2372.283 ms (ran 11 times)

Performance Results for 2019
2019_01.................5.922 ms (ran 100 times)
2019_02................62.731 ms (ran 100 times)
2019_03...............337.197 ms (ran 75 times)
```
### `perf2.dart`: By importing and running part1 and part2 separately
#### By year and time
```
Performance Results for 2021
2021_01 part 1.................0.1130 ms (ran 1000 times)
2021_03 part 2.................0.2170 ms (ran 1000 times)
2021_01 part 2.................0.2180 ms (ran 1000 times)
2021_03 part 1.................0.2840 ms (ran 1000 times)
2021_02 part 2.................0.6680 ms (ran 1000 times)
2021_02 part 1.................0.6820 ms (ran 1000 times)

Performance Results for 2020
2020_20 part 2.................0.0000 ms (ran 1000 times)
2020_25 part 2.................0.0000 ms (ran 1000 times)
2020_23 part 1.................0.0180 ms (ran 1000 times)
2020_20 part 1.................0.5550 ms (ran 1000 times)
2020_19 part 1.................1.8530 ms (ran 1000 times)
2020_19 part 2.................2.9960 ms (ran 1000 times)
2020_24 part 1.................5.6400 ms (ran 887 times)
2020_25 part 1.................57.9180 ms (ran 87 times)
2020_23 part 2.................2170.3500 ms (ran 3 times)
2020_24 part 2.................2292.1940 ms (ran 3 times)

Performance Results for 2019
2019_01 part 1.................0.0070 ms (ran 1000 times)
2019_01 part 2.................0.0090 ms (ran 1000 times)
2019_02 part 1.................0.0160 ms (ran 1000 times)
2019_02 part 2.................41.5850 ms (ran 121 times)
2019_03 part 1.................149.9000 ms (ran 34 times)
2019_03 part 2.................183.2720 ms (ran 28 times)
```

#### By date
```
Performance Results for 2021
2021_01 part 1.................0.1130 ms (ran 1000 times)
2021_01 part 2.................0.2180 ms (ran 1000 times)
2021_02 part 1.................0.6820 ms (ran 1000 times)
2021_02 part 2.................0.6680 ms (ran 1000 times)
2021_03 part 1.................0.2840 ms (ran 1000 times)
2021_03 part 2.................0.2170 ms (ran 1000 times)

Performance Results for 2020
2020_19 part 1.................1.8530 ms (ran 1000 times)
2020_19 part 2.................2.9960 ms (ran 1000 times)
2020_20 part 1.................0.5550 ms (ran 1000 times)
2020_20 part 2.................0.0000 ms (ran 1000 times)
2020_23 part 1.................0.0180 ms (ran 1000 times)
2020_23 part 2.................2170.3500 ms (ran 3 times)
2020_24 part 1.................5.6400 ms (ran 887 times)
2020_24 part 2.................2292.1940 ms (ran 3 times)
2020_25 part 1.................57.9180 ms (ran 87 times)
2020_25 part 2.................0.0000 ms (ran 1000 times)

Performance Results for 2019
2019_01 part 1.................0.0070 ms (ran 1000 times)
2019_01 part 2.................0.0090 ms (ran 1000 times)
2019_02 part 1.................0.0160 ms (ran 1000 times)
2019_02 part 2.................41.5850 ms (ran 121 times)
2019_03 part 1.................149.9000 ms (ran 34 times)
2019_03 part 2.................183.2720 ms (ran 28 times)
```