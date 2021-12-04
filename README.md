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
2021_01.................6.478 ms (ran 100 times)
2021_03.................7.037 ms (ran 100 times)
2021_02.................8.077 ms (ran 100 times)
2021_04................15.969 ms (ran 100 times)

Performance Results for 2020
2020_20..................6.84 ms (ran 100 times)
2020_19................41.227 ms (ran 100 times)
2020_25................72.865 ms (ran 100 times)
2020_23..............2215.086 ms (ran 12 times)
2020_24..............2359.554 ms (ran 11 times)

Performance Results for 2019
2019_01.................5.762 ms (ran 100 times)
2019_08.................8.217 ms (ran 100 times)
2019_02................63.215 ms (ran 100 times)
2019_04...............312.774 ms (ran 80 times)
2019_03...............339.544 ms (ran 74 times)
```
### `perf2.dart`: By importing and running part1 and part2 separately
#### By year, part and execution time
```
Performance Results for 2021
2021_01 part 1.................0.1150 ms (ran 1000 times)
2021_01 part 2.................0.2230 ms (ran 1000 times)
2021_03 part 2.................0.2230 ms (ran 1000 times)
2021_03 part 1.................0.3060 ms (ran 1000 times)
2021_02 part 2.................0.6850 ms (ran 1000 times)
2021_02 part 1.................0.6930 ms (ran 1000 times)
2021_04 part 1.................2.3680 ms (ran 1000 times)
2021_04 part 2.................4.4990 ms (ran 1000 times)

Performance Results for 2020
2020_20 part 2.................0.0000 ms (ran 1000 times)
2020_25 part 2.................0.0000 ms (ran 1000 times)
2020_23 part 1.................0.0210 ms (ran 1000 times)
2020_20 part 1.................0.5940 ms (ran 1000 times)
2020_19 part 1.................1.8850 ms (ran 1000 times)
2020_19 part 2.................3.0610 ms (ran 1000 times)
2020_24 part 1.................5.6470 ms (ran 886 times)
2020_25 part 1.................58.7060 ms (ran 86 times)
2020_23 part 2.................2191.7680 ms (ran 3 times)
2020_24 part 2.................2360.7950 ms (ran 3 times)

Performance Results for 2019
2019_01 part 1.................0.0070 ms (ran 1000 times)
2019_01 part 2.................0.0090 ms (ran 1000 times)
2019_02 part 1.................0.0160 ms (ran 1000 times)
2019_08 part 2.................0.7620 ms (ran 1000 times)
2019_08 part 1.................0.8310 ms (ran 1000 times)
2019_02 part 2.................48.5640 ms (ran 103 times)
2019_04 part 1.................88.9170 ms (ran 57 times)
2019_03 part 1.................170.6370 ms (ran 30 times)
2019_03 part 2.................180.4940 ms (ran 28 times)
2019_04 part 2.................202.5300 ms (ran 25 times)
```

#### By year, date and part
```
Performance Results for 2021
2021_01 part 1.................0.1150 ms (ran 1000 times)
2021_01 part 2.................0.2230 ms (ran 1000 times)
2021_02 part 1.................0.6930 ms (ran 1000 times)
2021_02 part 2.................0.6850 ms (ran 1000 times)
2021_03 part 1.................0.3060 ms (ran 1000 times)
2021_03 part 2.................0.2230 ms (ran 1000 times)
2021_04 part 1.................2.3680 ms (ran 1000 times)
2021_04 part 2.................4.4990 ms (ran 1000 times)

Performance Results for 2020
2020_19 part 1.................1.8850 ms (ran 1000 times)
2020_19 part 2.................3.0610 ms (ran 1000 times)
2020_20 part 1.................0.5940 ms (ran 1000 times)
2020_20 part 2.................0.0000 ms (ran 1000 times)
2020_23 part 1.................0.0210 ms (ran 1000 times)
2020_23 part 2.................2191.7680 ms (ran 3 times)
2020_24 part 1.................5.6470 ms (ran 886 times)
2020_24 part 2.................2360.7950 ms (ran 3 times)
2020_25 part 1.................58.7060 ms (ran 86 times)
2020_25 part 2.................0.0000 ms (ran 1000 times)

Performance Results for 2019
2019_01 part 1.................0.0070 ms (ran 1000 times)
2019_01 part 2.................0.0090 ms (ran 1000 times)
2019_02 part 1.................0.0160 ms (ran 1000 times)
2019_02 part 2.................48.5640 ms (ran 103 times)
2019_03 part 1.................170.6370 ms (ran 30 times)
2019_03 part 2.................180.4940 ms (ran 28 times)
2019_04 part 1.................88.9170 ms (ran 57 times)
2019_04 part 2.................202.5300 ms (ran 25 times)
2019_08 part 1.................0.8310 ms (ran 1000 times)
2019_08 part 2.................0.7620 ms (ran 1000 times)
```