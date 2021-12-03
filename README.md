# Advent of Code 2021
All solutions can be found in the `solutions` folder.
## Usage
Don't forget to have `AOC_SESSION=<your_session_token>` loaded into your environment in order to use dynamic loading of input files as well as automatic submission. Alternatively, you can create a `env.json` with the content `{"sessions": ["<your_session_token>"]}`


## Performance
`perf.dart` compiles all solutions to executables, runs them as many times as it can in 20 seconds (or until it has been run 100 times), and takes the average execution time. Remember that every solution runs both part1 and part2, but at least it skips the examples/unit tests since it passes `--performance` as an argument to each executable.

Here are the results, sorted by year and speed:

### `perf.dart`: By compiling and running each solution
```
Performance Results for 2021
2021_01.................6.596 ms (ran 100 times)
2021_03.................7.471 ms (ran 100 times)
2021_02.................8.502 ms (ran 100 times)

Performance Results for 2020
2020_20.................6.648 ms (ran 100 times)
2020_19................41.038 ms (ran 100 times)
2020_25................76.064 ms (ran 100 times)
2020_23..............2204.557 ms (ran 12 times)
2020_24..............2359.909 ms (ran 11 times)
```
### `perf2.dart`: By importing and running part1 and part2 separately
```
Performance Results for 2021
Performance Results for 2021
2021_01 part 1.................0.1054 ms (ran 1000 times)
2021_01 part 2.................0.2094 ms (ran 1000 times)
2021_03 part 2.................0.2112 ms (ran 1000 times)
2021_03 part 1.................0.2792 ms (ran 1000 times)
2021_02 part 2.................0.6823 ms (ran 1000 times)
2021_02 part 1.................0.7204 ms (ran 1000 times)

Performance Results for 2020
2020_20 part 2.................0.0000 ms (ran 1000 times)
2020_25 part 2.................0.0000 ms (ran 1000 times)
2020_23 part 1.................0.0184 ms (ran 1000 times)
2020_20 part 1.................0.5856 ms (ran 1000 times)
2020_19 part 1.................1.7994 ms (ran 1000 times)
2020_19 part 2.................2.8783 ms (ran 1000 times)
2020_24 part 1.................5.6818 ms (ran 881 times)
2020_25 part 1.................58.2201 ms (ran 86 times)
2020_23 part 2.................2076.0743 ms (ran 3 times)
2020_24 part 2.................2287.6843 ms (ran 3 times)
```