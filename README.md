# Advent of Code 2021
All solutions can be found in the `solutions` folder.
## Usage
Don't forget to have `AOC_SESSION=<your_session_token>` loaded into your environment in order to use dynamic loading of input files as well as automatic submission. Alternatively, you can create a `env.json` with the content `{"sessions": ["<your_session_token>"]}`


## Performance
`perf.dart` compiles all solutions to executables, runs them as many times as it can in 20 seconds (or until it has been run 100 times), and takes the average execution time. Remember that every solution runs both part1 and part2, but at least it skips the examples/unit tests since it passes `--performance` as an argument to each executable.

Here are the results, sorted by year and speed:

### `perf.dart`: By compiling and running each solution

<details>
<summary>Performance by year and execution time</summary>

```
Performance Results for 2021
2021_01.................6.321 ms (ran 100 times)
2021_03.................6.672 ms (ran 100 times)
2021_02.................8.332 ms (ran 100 times)
2021_04................16.312 ms (ran 100 times)

Performance Results for 2020
2020_20.................7.914 ms (ran 100 times)
2020_19................43.016 ms (ran 100 times)
2020_25................75.344 ms (ran 100 times)
2020_23..............2247.265 ms (ran 12 times)
2020_24..............2401.168 ms (ran 11 times)

Performance Results for 2019
2019_01.................5.581 ms (ran 100 times)
2019_08.................8.098 ms (ran 100 times)
2019_02................59.864 ms (ran 100 times)
2019_04...............311.425 ms (ran 81 times)
2019_03...............342.157 ms (ran 74 times)

Performance Results for 2015
2015_01.................5.815 ms (ran 100 times)
2015_02................10.137 ms (ran 100 times)
2015_05................16.211 ms (ran 100 times)
2015_03...............106.238 ms (ran 100 times)
2015_04.............26508.547 ms (ran 1 times)
```
</details>

### `perf2.dart`: By importing and running part1 and part2 separately

<details>
<summary>(Parts individually) Performance by year and execution time</summary>

```
Performance Results for 2021
2021_01 part 1.................0.1100 ms (ran 1000 times)
2021_03 part 2.................0.2110 ms (ran 1000 times)
2021_01 part 2.................0.2190 ms (ran 1000 times)
2021_03 part 1.................0.2800 ms (ran 1000 times)
2021_02 part 2.................0.6540 ms (ran 1000 times)
2021_02 part 1.................0.6840 ms (ran 1000 times)
2021_04 part 1.................2.2750 ms (ran 1000 times)
2021_04 part 2.................4.3050 ms (ran 1000 times)

Performance Results for 2020
2020_20 part 2.................0.0000 ms (ran 1000 times)
2020_25 part 2.................0.0000 ms (ran 1000 times)
2020_23 part 1.................0.0190 ms (ran 1000 times)
2020_20 part 1.................0.9080 ms (ran 1000 times)
2020_19 part 1.................1.8240 ms (ran 1000 times)
2020_19 part 2.................2.9320 ms (ran 1000 times)
2020_24 part 1.................5.7110 ms (ran 876 times)
2020_25 part 1.................58.6630 ms (ran 86 times)
2020_23 part 2.................2046.6840 ms (ran 3 times)
2020_24 part 2.................2280.9150 ms (ran 3 times)

Performance Results for 2019
2019_01 part 1.................0.0070 ms (ran 1000 times)
2019_01 part 2.................0.0090 ms (ran 1000 times)
2019_02 part 1.................0.0160 ms (ran 1000 times)
2019_08 part 2.................0.7780 ms (ran 1000 times)
2019_08 part 1.................0.8390 ms (ran 1000 times)
2019_02 part 2.................45.9030 ms (ran 109 times)
2019_04 part 1.................85.9060 ms (ran 59 times)
2019_03 part 1.................164.5610 ms (ran 31 times)
2019_03 part 2.................165.2760 ms (ran 31 times)
2019_04 part 2.................207.7720 ms (ran 25 times)

Performance Results for 2015
2015_01 part 2.................0.0600 ms (ran 1000 times)
2015_01 part 1.................0.1350 ms (ran 1000 times)
2015_02 part 1.................1.4450 ms (ran 1000 times)
2015_02 part 2.................1.4480 ms (ran 1000 times)
2015_05 part 1.................2.3510 ms (ran 1000 times)
2015_05 part 2.................4.9380 ms (ran 1000 times)
2015_03 part 1.................24.7550 ms (ran 202 times)
2015_03 part 2.................64.9120 ms (ran 78 times)
2015_04 part 1.................899.2380 ms (ran 6 times)
2015_04 part 2.................25810.2480 ms (ran 1 times)
```
</details>


<details>
<summary>(Parts individually) Performance by year and date</summary>

```
Performance Results for 2021
2021_01 part 1.................0.1100 ms (ran 1000 times)
2021_01 part 2.................0.2190 ms (ran 1000 times)
2021_02 part 1.................0.6840 ms (ran 1000 times)
2021_02 part 2.................0.6540 ms (ran 1000 times)
2021_03 part 1.................0.2800 ms (ran 1000 times)
2021_03 part 2.................0.2110 ms (ran 1000 times)
2021_04 part 1.................2.2750 ms (ran 1000 times)
2021_04 part 2.................4.3050 ms (ran 1000 times)

Performance Results for 2020
2020_19 part 1.................1.8240 ms (ran 1000 times)
2020_19 part 2.................2.9320 ms (ran 1000 times)
2020_20 part 1.................0.9080 ms (ran 1000 times)
2020_20 part 2.................0.0000 ms (ran 1000 times)
2020_23 part 1.................0.0190 ms (ran 1000 times)
2020_23 part 2.................2046.6840 ms (ran 3 times)
2020_24 part 1.................5.7110 ms (ran 876 times)
2020_24 part 2.................2280.9150 ms (ran 3 times)
2020_25 part 1.................58.6630 ms (ran 86 times)
2020_25 part 2.................0.0000 ms (ran 1000 times)

Performance Results for 2019
2019_01 part 1.................0.0070 ms (ran 1000 times)
2019_01 part 2.................0.0090 ms (ran 1000 times)
2019_02 part 1.................0.0160 ms (ran 1000 times)
2019_02 part 2.................45.9030 ms (ran 109 times)
2019_03 part 1.................164.5610 ms (ran 31 times)
2019_03 part 2.................165.2760 ms (ran 31 times)
2019_04 part 1.................85.9060 ms (ran 59 times)
2019_04 part 2.................207.7720 ms (ran 25 times)
2019_08 part 1.................0.8390 ms (ran 1000 times)
2019_08 part 2.................0.7780 ms (ran 1000 times)

Performance Results for 2015
2015_01 part 1.................0.1350 ms (ran 1000 times)
2015_01 part 2.................0.0600 ms (ran 1000 times)
2015_02 part 1.................1.4450 ms (ran 1000 times)
2015_02 part 2.................1.4480 ms (ran 1000 times)
2015_03 part 1.................24.7550 ms (ran 202 times)
2015_03 part 2.................64.9120 ms (ran 78 times)
2015_04 part 1.................899.2380 ms (ran 6 times)
2015_04 part 2.................25810.2480 ms (ran 1 times)
2015_05 part 1.................2.3510 ms (ran 1000 times)
2015_05 part 2.................4.9380 ms (ran 1000 times)
```
</details>