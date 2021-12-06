# Advent of Code 2021
All solutions can be found in the `solutions` folder.
## Usage
Don't forget to have `AOC_SESSION=<your_session_token>` loaded into your environment in order to use dynamic loading of input files as well as automatic submission. Alternatively, you can create a `env.json` with the content `{"sessions": ["<your_session_token>"]}`


## Performance
`perf2.dart` imports all solutions and runs part1 and part2 separately, ignoring any example inputs. It fetches the input at the start and then just calls the solutions with that input which means that the time it takes to "get the input" is not part of the measurement. `perf.sh` will compile and run `perf2.dart` which in turn will compile and run every solution for every part for every year.

Note: `0.0000 ms` most likely means a solution to that part has not been implemented.

<details>
<summary>Every part, every year by performance</summary>

```
2020_20 part 2.................0.0000 ms
2020_25 part 2.................0.0000 ms
2019_01 part 1.................0.0072 ms
2019_01 part 2.................0.0091 ms
2019_02 part 1.................0.0168 ms
2020_23 part 1.................0.0195 ms
2021_06 part 2.................0.0301 ms
2015_01 part 2.................0.0612 ms
2021_01 part 1.................0.1066 ms
2015_01 part 1.................0.1386 ms
2021_01 part 2.................0.2113 ms
2021_03 part 2.................0.2120 ms
2021_03 part 1.................0.2782 ms
2015_08 part 1.................0.3772 ms
2015_07 part 1.................0.4705 ms
2015_07 part 2.................0.5735 ms
2021_02 part 2.................0.6302 ms
2021_02 part 1.................0.6621 ms
2015_08 part 2.................0.7362 ms
2015_12 part 2.................0.7764 ms
2019_08 part 2.................0.8373 ms
2020_20 part 1.................0.8879 ms
2019_08 part 1.................0.9197 ms
2015_12 part 1.................0.9732 ms
2015_02 part 1.................1.3852 ms
2015_02 part 2.................1.3932 ms
2020_19 part 1.................1.8215 ms
2021_04 part 1.................2.2105 ms
2015_05 part 1.................2.3357 ms
2020_19 part 2.................2.9254 ms
2021_04 part 2.................4.2390 ms
2015_14 part 1.................4.8459 ms
2015_05 part 2.................4.9328 ms
2020_24 part 1.................5.7232 ms
2015_14 part 2.................6.3638 ms
2021_05 part 2.................14.2387 ms
2021_05 part 1.................16.2841 ms
2015_03 part 1.................24.4314 ms
2019_02 part 2.................45.1919 ms
2021_06 part 1.................55.8784 ms
2020_25 part 1.................57.7132 ms
2015_10 part 1.................59.3721 ms
2015_03 part 2.................66.9995 ms
2015_11 part 1.................67.4273 ms
2015_09 part 1.................80.1035 ms
2015_09 part 2.................83.7955 ms
2015_15 part 2.................92.1366 ms
2015_13 part 1.................97.6959 ms
2019_04 part 1.................99.7123 ms
2019_03 part 1.................164.5206 ms
2019_03 part 2.................172.7846 ms
2015_15 part 1.................174.0734 ms
2019_04 part 2.................215.3491 ms
2015_11 part 2.................345.8531 ms
2015_06 part 1.................368.0448 ms
2015_06 part 2.................414.9818 ms
2015_10 part 2.................704.2631 ms
2015_04 part 1.................897.2298 ms
2015_13 part 2.................953.5350 ms
2020_23 part 2.................2092.5167 ms
2020_24 part 2.................2353.8277 ms
2015_04 part 2.................25704.8030 ms
```
</details>

<details>
<summary>Separated by year, sorted after execution time</summary>

```
Performance Results for 2021
2021_06 part 2.................0.0300 ms (ran 1000 times)
2021_01 part 1.................0.1060 ms (ran 1000 times)
2021_01 part 2.................0.2110 ms (ran 1000 times)
2021_03 part 2.................0.2110 ms (ran 1000 times)
2021_03 part 1.................0.2780 ms (ran 1000 times)
2021_02 part 2.................0.6300 ms (ran 1000 times)
2021_02 part 1.................0.6620 ms (ran 1000 times)
2021_04 part 1.................2.2100 ms (ran 1000 times)
2021_04 part 2.................4.2390 ms (ran 1000 times)
2021_05 part 2.................14.2380 ms (ran 352 times)
2021_05 part 1.................16.2840 ms (ran 308 times)
2021_06 part 1.................55.8780 ms (ran 90 times)

Performance Results for 2020
2020_20 part 2.................0.0000 ms (ran 1000 times)
2020_25 part 2.................0.0000 ms (ran 1000 times)
2020_23 part 1.................0.0190 ms (ran 1000 times)
2020_20 part 1.................0.8870 ms (ran 1000 times)
2020_19 part 1.................1.8210 ms (ran 1000 times)
2020_19 part 2.................2.9250 ms (ran 1000 times)
2020_24 part 1.................5.7230 ms (ran 874 times)
2020_25 part 1.................57.7130 ms (ran 87 times)
2020_23 part 2.................2092.5160 ms (ran 3 times)
2020_24 part 2.................2353.8270 ms (ran 3 times)

Performance Results for 2019
2019_01 part 1.................0.0070 ms (ran 1000 times)
2019_01 part 2.................0.0090 ms (ran 1000 times)
2019_02 part 1.................0.0160 ms (ran 1000 times)
2019_08 part 2.................0.8370 ms (ran 1000 times)
2019_08 part 1.................0.9190 ms (ran 1000 times)
2019_02 part 2.................45.1910 ms (ran 111 times)
2019_04 part 1.................99.7120 ms (ran 51 times)
2019_03 part 1.................164.5200 ms (ran 31 times)
2019_03 part 2.................172.7840 ms (ran 29 times)
2019_04 part 2.................215.3490 ms (ran 24 times)

Performance Results for 2015
2015_01 part 2.................0.0610 ms (ran 1000 times)
2015_01 part 1.................0.1380 ms (ran 1000 times)
2015_08 part 1.................0.3770 ms (ran 1000 times)
2015_07 part 1.................0.4700 ms (ran 1000 times)
2015_07 part 2.................0.5730 ms (ran 1000 times)
2015_08 part 2.................0.7360 ms (ran 1000 times)
2015_12 part 2.................0.7760 ms (ran 1000 times)
2015_12 part 1.................0.9730 ms (ran 1000 times)
2015_02 part 1.................1.3850 ms (ran 1000 times)
2015_02 part 2.................1.3930 ms (ran 1000 times)
2015_05 part 1.................2.3350 ms (ran 1000 times)
2015_14 part 1.................4.8450 ms (ran 1000 times)
2015_05 part 2.................4.9320 ms (ran 1000 times)
2015_14 part 2.................6.3630 ms (ran 786 times)
2015_03 part 1.................24.4310 ms (ran 205 times)
2015_10 part 1.................59.3720 ms (ran 85 times)
2015_03 part 2.................66.9990 ms (ran 75 times)
2015_11 part 1.................67.4270 ms (ran 75 times)
2015_09 part 1.................80.1030 ms (ran 63 times)
2015_09 part 2.................83.7950 ms (ran 60 times)
2015_15 part 2.................92.1360 ms (ran 55 times)
2015_13 part 1.................97.6950 ms (ran 52 times)
2015_15 part 1.................174.0730 ms (ran 29 times)
2015_11 part 2.................345.8530 ms (ran 15 times)
2015_06 part 1.................368.0440 ms (ran 14 times)
2015_06 part 2.................414.9810 ms (ran 13 times)
2015_10 part 2.................704.2630 ms (ran 8 times)
2015_04 part 1.................897.2290 ms (ran 6 times)
2015_13 part 2.................953.5350 ms (ran 6 times)
2015_04 part 2.................25704.8030 ms (ran 1 times)
```
</details>


<details>
<summary>Separated by year, sorted after date</summary>

```
Performance Results for 2021
2021_01 part 1.................0.1060 ms (ran 1000 times)
2021_01 part 2.................0.2110 ms (ran 1000 times)
2021_02 part 1.................0.6620 ms (ran 1000 times)
2021_02 part 2.................0.6300 ms (ran 1000 times)
2021_03 part 1.................0.2780 ms (ran 1000 times)
2021_03 part 2.................0.2110 ms (ran 1000 times)
2021_04 part 1.................2.2100 ms (ran 1000 times)
2021_04 part 2.................4.2390 ms (ran 1000 times)
2021_05 part 1.................16.2840 ms (ran 308 times)
2021_05 part 2.................14.2380 ms (ran 352 times)
2021_06 part 1.................55.8780 ms (ran 90 times)
2021_06 part 2.................0.0300 ms (ran 1000 times)

Performance Results for 2020
2020_19 part 1.................1.8210 ms (ran 1000 times)
2020_19 part 2.................2.9250 ms (ran 1000 times)
2020_20 part 1.................0.8870 ms (ran 1000 times)
2020_20 part 2.................0.0000 ms (ran 1000 times)
2020_23 part 1.................0.0190 ms (ran 1000 times)
2020_23 part 2.................2092.5160 ms (ran 3 times)
2020_24 part 1.................5.7230 ms (ran 874 times)
2020_24 part 2.................2353.8270 ms (ran 3 times)
2020_25 part 1.................57.7130 ms (ran 87 times)
2020_25 part 2.................0.0000 ms (ran 1000 times)

Performance Results for 2019
2019_01 part 1.................0.0070 ms (ran 1000 times)
2019_01 part 2.................0.0090 ms (ran 1000 times)
2019_02 part 1.................0.0160 ms (ran 1000 times)
2019_02 part 2.................45.1910 ms (ran 111 times)
2019_03 part 1.................164.5200 ms (ran 31 times)
2019_03 part 2.................172.7840 ms (ran 29 times)
2019_04 part 1.................99.7120 ms (ran 51 times)
2019_04 part 2.................215.3490 ms (ran 24 times)
2019_08 part 1.................0.9190 ms (ran 1000 times)
2019_08 part 2.................0.8370 ms (ran 1000 times)

Performance Results for 2015
2015_01 part 1.................0.1380 ms (ran 1000 times)
2015_01 part 2.................0.0610 ms (ran 1000 times)
2015_02 part 1.................1.3850 ms (ran 1000 times)
2015_02 part 2.................1.3930 ms (ran 1000 times)
2015_03 part 1.................24.4310 ms (ran 205 times)
2015_03 part 2.................66.9990 ms (ran 75 times)
2015_04 part 1.................897.2290 ms (ran 6 times)
2015_04 part 2.................25704.8030 ms (ran 1 times)
2015_05 part 1.................2.3350 ms (ran 1000 times)
2015_05 part 2.................4.9320 ms (ran 1000 times)
2015_06 part 1.................368.0440 ms (ran 14 times)
2015_06 part 2.................414.9810 ms (ran 13 times)
2015_07 part 1.................0.4700 ms (ran 1000 times)
2015_07 part 2.................0.5730 ms (ran 1000 times)
2015_08 part 1.................0.3770 ms (ran 1000 times)
2015_08 part 2.................0.7360 ms (ran 1000 times)
2015_09 part 1.................80.1030 ms (ran 63 times)
2015_09 part 2.................83.7950 ms (ran 60 times)
2015_10 part 1.................59.3720 ms (ran 85 times)
2015_10 part 2.................704.2630 ms (ran 8 times)
2015_11 part 1.................67.4270 ms (ran 75 times)
2015_11 part 2.................345.8530 ms (ran 15 times)
2015_12 part 1.................0.9730 ms (ran 1000 times)
2015_12 part 2.................0.7760 ms (ran 1000 times)
2015_13 part 1.................97.6950 ms (ran 52 times)
2015_13 part 2.................953.5350 ms (ran 6 times)
2015_14 part 1.................4.8450 ms (ran 1000 times)
2015_14 part 2.................6.3630 ms (ran 786 times)
2015_15 part 1.................174.0730 ms (ran 29 times)
2015_15 part 2.................92.1360 ms (ran 55 times)
```
</details>