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
2021_01.................6.723 ms (ran 100 times)
2021_03.................6.758 ms (ran 100 times)
2021_02.................7.865 ms (ran 100 times)

Performance Results for 2020
2020_20.................6.798 ms (ran 100 times)
2020_19................49.243 ms (ran 100 times)
2020_25................75.053 ms (ran 100 times)
2020_23..............2253.783 ms (ran 12 times)
2020_24..............2391.545 ms (ran 11 times)

Performance Results for 2019
2019_01.................5.702 ms (ran 100 times)
2019_02................61.187 ms (ran 100 times)
2019_04...............311.981 ms (ran 81 times)
2019_03...............341.239 ms (ran 74 times)
```
### `perf2.dart`: By importing and running part1 and part2 separately
#### By year and time
```
Performance Results for 2021
2021_01 part 1.................0.1260 ms (ran 1000 times)
2021_03 part 2.................0.2190 ms (ran 1000 times)
2021_01 part 2.................0.2370 ms (ran 1000 times)
2021_03 part 1.................0.2890 ms (ran 1000 times)
2021_02 part 2.................0.6670 ms (ran 1000 times)
2021_02 part 1.................0.7000 ms (ran 1000 times)

Performance Results for 2020
2020_20 part 2.................0.0000 ms (ran 1000 times)
2020_25 part 2.................0.0000 ms (ran 1000 times)
2020_23 part 1.................0.0180 ms (ran 1000 times)
2020_20 part 1.................0.5690 ms (ran 1000 times)
2020_19 part 1.................1.8190 ms (ran 1000 times)
2020_19 part 2.................2.9270 ms (ran 1000 times)
2020_24 part 1.................5.6580 ms (ran 884 times)
2020_25 part 1.................58.6620 ms (ran 86 times)
2020_23 part 2.................2114.9420 ms (ran 3 times)
2020_24 part 2.................2312.4960 ms (ran 3 times)

Performance Results for 2019
2019_01 part 1.................0.0070 ms (ran 1000 times)
2019_01 part 2.................0.0100 ms (ran 1000 times)
2019_02 part 1.................0.0170 ms (ran 1000 times)
2019_02 part 2.................43.8240 ms (ran 115 times)
2019_04 part 1.................92.7580 ms (ran 54 times)
2019_03 part 1.................176.4510 ms (ran 29 times)
2019_03 part 2.................179.7780 ms (ran 28 times)
2019_04 part 2.................205.5930 ms (ran 25 times)
```

#### By date
```
Performance Results for 2021
2021_01 part 1.................0.1260 ms (ran 1000 times)
2021_01 part 2.................0.2370 ms (ran 1000 times)
2021_02 part 1.................0.7000 ms (ran 1000 times)
2021_02 part 2.................0.6670 ms (ran 1000 times)
2021_03 part 1.................0.2890 ms (ran 1000 times)
2021_03 part 2.................0.2190 ms (ran 1000 times)

Performance Results for 2020
2020_19 part 1.................1.8190 ms (ran 1000 times)
2020_19 part 2.................2.9270 ms (ran 1000 times)
2020_20 part 1.................0.5690 ms (ran 1000 times)
2020_20 part 2.................0.0000 ms (ran 1000 times)
2020_23 part 1.................0.0180 ms (ran 1000 times)
2020_23 part 2.................2114.9420 ms (ran 3 times)
2020_24 part 1.................5.6580 ms (ran 884 times)
2020_24 part 2.................2312.4960 ms (ran 3 times)
2020_25 part 1.................58.6620 ms (ran 86 times)
2020_25 part 2.................0.0000 ms (ran 1000 times)

Performance Results for 2019
2019_01 part 1.................0.0070 ms (ran 1000 times)
2019_01 part 2.................0.0100 ms (ran 1000 times)
2019_02 part 1.................0.0170 ms (ran 1000 times)
2019_02 part 2.................43.8240 ms (ran 115 times)
2019_03 part 1.................176.4510 ms (ran 29 times)
2019_03 part 2.................179.7780 ms (ran 28 times)
2019_04 part 1.................92.7580 ms (ran 54 times)
2019_04 part 2.................205.5930 ms (ran 25 times)
```