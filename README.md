# Advent of Code 2021
All solutions can be found in the `solutions` folder.
## Usage
Don't forget to have `AOC_SESSION=<your_session_token>` loaded into your environment in order to use dynamic loading of input files as well as automatic submission. Alternatively, you can create a `env.json` with the content `{"sessions": ["<your_session_token>"]}`


## Performance
`perf.dart` compiles all solutions to executables, runs them as many times as it can in 20 seconds (or until it has been run 100 times), and takes the average execution time. Remember that every solution runs both part1 and part2, but at least it skips the examples/unit tests since it passes `--performance` as an argument to each executable.

<details>
<summary>Every part, every year by performance</summary>

```
2020_20 part 2.................0.0000 ms
2020_25 part 2.................0.0000 ms
2019_01 part 1.................0.0072 ms
2019_01 part 2.................0.0092 ms
2019_02 part 1.................0.0167 ms
2020_23 part 1.................0.0182 ms
2015_01 part 2.................0.0624 ms
2021_01 part 1.................0.1079 ms
2015_01 part 1.................0.1377 ms
2021_03 part 2.................0.2127 ms
2021_01 part 2.................0.2131 ms
2021_03 part 1.................0.2812 ms
2015_08 part 1.................0.3974 ms
2015_07 part 1.................0.4801 ms
2015_07 part 2.................0.5913 ms
2021_02 part 2.................0.6756 ms
2021_02 part 1.................0.6937 ms
2015_08 part 2.................0.7608 ms
2019_08 part 2.................0.7602 ms
2019_08 part 1.................0.8296 ms
2020_20 part 1.................0.8924 ms
2015_02 part 1.................1.5225 ms
2015_02 part 2.................1.5365 ms
2020_19 part 1.................1.8302 ms
2021_04 part 1.................2.3576 ms
2015_05 part 1.................2.5564 ms
2020_19 part 2.................2.9398 ms
2021_04 part 2.................4.4249 ms
2015_05 part 2.................5.1047 ms
2020_24 part 1.................5.8133 ms
2021_05 part 2.................14.3823 ms
2021_05 part 1.................16.2533 ms
2015_03 part 1.................24.6931 ms
2019_02 part 2.................44.5498 ms
2015_10 part 1.................52.6819 ms
2020_25 part 1.................57.3069 ms
2015_03 part 2.................64.8944 ms
2015_09 part 2.................82.8700 ms
2015_09 part 1.................82.9643 ms
2019_04 part 1.................92.7828 ms
2019_03 part 1.................173.1042 ms
2019_03 part 2.................177.0380 ms
2019_04 part 2.................218.6432 ms
2015_06 part 1.................380.5908 ms
2015_06 part 2.................457.0810 ms
2015_10 part 2.................709.6680 ms
2015_04 part 1.................926.8617 ms
2020_23 part 2.................2070.8877 ms
2020_24 part 2.................2297.4887 ms
2015_04 part 2.................26458.0180 ms

```
</details>

<details>
<summary>(Parts individually) Performance by year and execution time</summary>

```
Performance Results for 2021
2021_01 part 1.................0.1070 ms (ran 1000 times)
2021_03 part 2.................0.2120 ms (ran 1000 times)
2021_01 part 2.................0.2130 ms (ran 1000 times)
2021_03 part 1.................0.2810 ms (ran 1000 times)
2021_02 part 2.................0.6750 ms (ran 1000 times)
2021_02 part 1.................0.6930 ms (ran 1000 times)
2021_04 part 1.................2.3570 ms (ran 1000 times)
2021_04 part 2.................4.4240 ms (ran 1000 times)
2021_05 part 2.................14.3820 ms (ran 348 times)
2021_05 part 1.................16.2530 ms (ran 308 times)

Performance Results for 2020
2020_20 part 2.................0.0000 ms (ran 1000 times)
2020_25 part 2.................0.0000 ms (ran 1000 times)
2020_23 part 1.................0.0180 ms (ran 1000 times)
2020_20 part 1.................0.8920 ms (ran 1000 times)
2020_19 part 1.................1.8300 ms (ran 1000 times)
2020_19 part 2.................2.9390 ms (ran 1000 times)
2020_24 part 1.................5.8130 ms (ran 861 times)
2020_25 part 1.................57.3060 ms (ran 88 times)
2020_23 part 2.................2070.8870 ms (ran 3 times)
2020_24 part 2.................2297.4880 ms (ran 3 times)

Performance Results for 2019
2019_01 part 1.................0.0070 ms (ran 1000 times)
2019_01 part 2.................0.0090 ms (ran 1000 times)
2019_02 part 1.................0.0160 ms (ran 1000 times)
2019_08 part 2.................0.7600 ms (ran 1000 times)
2019_08 part 1.................0.8290 ms (ran 1000 times)
2019_02 part 2.................44.5490 ms (ran 113 times)
2019_04 part 1.................92.7820 ms (ran 54 times)
2019_03 part 1.................173.1040 ms (ran 29 times)
2019_03 part 2.................177.0380 ms (ran 29 times)
2019_04 part 2.................218.6430 ms (ran 23 times)

Performance Results for 2015
2015_01 part 2.................0.0620 ms (ran 1000 times)
2015_01 part 1.................0.1370 ms (ran 1000 times)
2015_08 part 1.................0.3970 ms (ran 1000 times)
2015_07 part 1.................0.4800 ms (ran 1000 times)
2015_07 part 2.................0.5910 ms (ran 1000 times)
2015_08 part 2.................0.7600 ms (ran 1000 times)
2015_02 part 1.................1.5220 ms (ran 1000 times)
2015_02 part 2.................1.5360 ms (ran 1000 times)
2015_05 part 1.................2.5560 ms (ran 1000 times)
2015_05 part 2.................5.1040 ms (ran 980 times)
2015_03 part 1.................24.6930 ms (ran 203 times)
2015_10 part 1.................52.6810 ms (ran 95 times)
2015_03 part 2.................64.8940 ms (ran 78 times)
2015_09 part 2.................82.8700 ms (ran 61 times)
2015_09 part 1.................82.9640 ms (ran 61 times)
2015_06 part 1.................380.5900 ms (ran 14 times)
2015_06 part 2.................457.0810 ms (ran 11 times)
2015_10 part 2.................709.6680 ms (ran 8 times)
2015_04 part 1.................926.8610 ms (ran 6 times)
2015_04 part 2.................26458.0180 ms (ran 1 times)
```
</details>


<details>
<summary>(Parts individually) Performance by year and date</summary>

```
Performance Results for 2021
2021_01 part 1.................0.1070 ms (ran 1000 times)
2021_01 part 2.................0.2130 ms (ran 1000 times)
2021_02 part 1.................0.6930 ms (ran 1000 times)
2021_02 part 2.................0.6750 ms (ran 1000 times)
2021_03 part 1.................0.2810 ms (ran 1000 times)
2021_03 part 2.................0.2120 ms (ran 1000 times)
2021_04 part 1.................2.3570 ms (ran 1000 times)
2021_04 part 2.................4.4240 ms (ran 1000 times)
2021_05 part 1.................16.2530 ms (ran 308 times)
2021_05 part 2.................14.3820 ms (ran 348 times)

Performance Results for 2020
2020_19 part 1.................1.8300 ms (ran 1000 times)
2020_19 part 2.................2.9390 ms (ran 1000 times)
2020_20 part 1.................0.8920 ms (ran 1000 times)
2020_20 part 2.................0.0000 ms (ran 1000 times)
2020_23 part 1.................0.0180 ms (ran 1000 times)
2020_23 part 2.................2070.8870 ms (ran 3 times)
2020_24 part 1.................5.8130 ms (ran 861 times)
2020_24 part 2.................2297.4880 ms (ran 3 times)
2020_25 part 1.................57.3060 ms (ran 88 times)
2020_25 part 2.................0.0000 ms (ran 1000 times)

Performance Results for 2019
2019_01 part 1.................0.0070 ms (ran 1000 times)
2019_01 part 2.................0.0090 ms (ran 1000 times)
2019_02 part 1.................0.0160 ms (ran 1000 times)
2019_02 part 2.................44.5490 ms (ran 113 times)
2019_03 part 1.................173.1040 ms (ran 29 times)
2019_03 part 2.................177.0380 ms (ran 29 times)
2019_04 part 1.................92.7820 ms (ran 54 times)
2019_04 part 2.................218.6430 ms (ran 23 times)
2019_08 part 1.................0.8290 ms (ran 1000 times)
2019_08 part 2.................0.7600 ms (ran 1000 times)

Performance Results for 2015
2015_01 part 1.................0.1370 ms (ran 1000 times)
2015_01 part 2.................0.0620 ms (ran 1000 times)
2015_02 part 1.................1.5220 ms (ran 1000 times)
2015_02 part 2.................1.5360 ms (ran 1000 times)
2015_03 part 1.................24.6930 ms (ran 203 times)
2015_03 part 2.................64.8940 ms (ran 78 times)
2015_04 part 1.................926.8610 ms (ran 6 times)
2015_04 part 2.................26458.0180 ms (ran 1 times)
2015_05 part 1.................2.5560 ms (ran 1000 times)
2015_05 part 2.................5.1040 ms (ran 980 times)
2015_06 part 1.................380.5900 ms (ran 14 times)
2015_06 part 2.................457.0810 ms (ran 11 times)
2015_07 part 1.................0.4800 ms (ran 1000 times)
2015_07 part 2.................0.5910 ms (ran 1000 times)
2015_08 part 1.................0.3970 ms (ran 1000 times)
2015_08 part 2.................0.7600 ms (ran 1000 times)
2015_09 part 1.................82.9640 ms (ran 61 times)
2015_09 part 2.................82.8700 ms (ran 61 times)
2015_10 part 1.................52.6810 ms (ran 95 times)
2015_10 part 2.................709.6680 ms (ran 8 times)
```
</details>