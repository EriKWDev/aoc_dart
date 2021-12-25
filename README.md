# Advent of Code
All solutions can be found in the `solutions` folder. During 2021, I began solving in dart, but I switched to Nim after day 7 because I missed tuples soo much. See my Nim repo here: [`aoc_nim`](https://github.com/EriKWDev/aoc_nim)
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
2019_01 part 1.................0.0075 ms
2019_01 part 2.................0.0093 ms
2019_02 part 1.................0.0172 ms
2020_23 part 1.................0.0213 ms
2021_06 part 2.................0.0308 ms
2015_01 part 2.................0.0629 ms
2021_01 part 1.................0.1133 ms
2015_01 part 1.................0.1376 ms
2021_03 part 2.................0.2118 ms
2021_01 part 2.................0.2273 ms
2021_03 part 1.................0.2847 ms
2015_08 part 1.................0.3841 ms
2015_07 part 1.................0.4721 ms
2015_07 part 2.................0.5753 ms
2021_02 part 2.................0.6867 ms
2021_02 part 1.................0.6923 ms
2015_08 part 2.................0.7349 ms
2015_12 part 2.................0.7447 ms
2019_08 part 2.................0.8418 ms
2019_08 part 1.................0.9021 ms
2020_20 part 1.................0.9042 ms
2015_12 part 1.................1.0298 ms
2015_02 part 1.................1.5073 ms
2015_16 part 1.................1.5229 ms
2015_02 part 2.................1.5278 ms
2020_19 part 1.................1.8401 ms
2015_16 part 2.................1.9245 ms
2021_04 part 1.................2.3395 ms
2015_05 part 1.................2.3983 ms
2020_19 part 2.................2.9430 ms
2021_04 part 2.................4.3936 ms
2015_14 part 1.................4.8089 ms
2015_05 part 2.................4.9831 ms
2020_24 part 1.................5.8012 ms
2015_14 part 2.................6.3235 ms
2021_05 part 2.................14.3546 ms
2021_05 part 1.................16.5286 ms
2015_03 part 1.................24.9735 ms
2015_09 part 2.................26.7839 ms
2015_09 part 1.................26.8591 ms
2015_13 part 1.................45.0636 ms
2019_02 part 2.................45.2917 ms
2015_10 part 1.................54.9729 ms
2021_06 part 1.................58.2711 ms
2020_25 part 1.................58.3445 ms
2015_03 part 2.................67.1456 ms
2015_11 part 1.................68.7785 ms
2015_15 part 2.................98.2084 ms
2019_04 part 1.................103.1147 ms
2015_18 part 2.................150.4401 ms
2015_18 part 1.................150.4477 ms
2019_03 part 1.................166.7548 ms
2019_03 part 2.................168.1457 ms
2015_15 part 1.................179.2633 ms
2019_04 part 2.................221.4431 ms
2015_11 part 2.................354.7869 ms
2015_06 part 1.................367.2061 ms
2015_06 part 2.................410.3135 ms
2015_13 part 2.................432.9064 ms
2015_10 part 2.................753.0264 ms
2015_04 part 1.................892.1813 ms
2015_17 part 1.................977.1880 ms
2015_17 part 2.................982.7715 ms
2020_23 part 2.................2118.8867 ms
2020_24 part 2.................2287.7750 ms
2015_04 part 2.................25678.8000 ms
```
</details>

<details>
<summary>Separated by year, sorted after execution time</summary>

```
Performance Results for 2021
2021_06 part 2.................0.0300 ms (ran 1000 times)
2021_01 part 1.................0.1130 ms (ran 1000 times)
2021_03 part 2.................0.2110 ms (ran 1000 times)
2021_01 part 2.................0.2270 ms (ran 1000 times)
2021_03 part 1.................0.2840 ms (ran 1000 times)
2021_02 part 2.................0.6860 ms (ran 1000 times)
2021_02 part 1.................0.6920 ms (ran 1000 times)
2021_04 part 1.................2.3390 ms (ran 1000 times)
2021_04 part 2.................4.3930 ms (ran 1000 times)
2021_05 part 2.................14.3540 ms (ran 349 times)
2021_05 part 1.................16.5280 ms (ran 303 times)
2021_06 part 1.................58.2710 ms (ran 86 times)

Performance Results for 2020
2020_20 part 2.................0.0000 ms (ran 1000 times)
2020_25 part 2.................0.0000 ms (ran 1000 times)
2020_23 part 1.................0.0210 ms (ran 1000 times)
2020_20 part 1.................0.9040 ms (ran 1000 times)
2020_19 part 1.................1.8400 ms (ran 1000 times)
2020_19 part 2.................2.9420 ms (ran 1000 times)
2020_24 part 1.................5.8010 ms (ran 862 times)
2020_25 part 1.................58.3440 ms (ran 86 times)
2020_23 part 2.................2118.8860 ms (ran 3 times)
2020_24 part 2.................2287.7750 ms (ran 3 times)

Performance Results for 2019
2019_01 part 1.................0.0070 ms (ran 1000 times)
2019_01 part 2.................0.0090 ms (ran 1000 times)
2019_02 part 1.................0.0170 ms (ran 1000 times)
2019_08 part 2.................0.8410 ms (ran 1000 times)
2019_08 part 1.................0.9020 ms (ran 1000 times)
2019_02 part 2.................45.2910 ms (ran 111 times)
2019_04 part 1.................103.1140 ms (ran 49 times)
2019_03 part 1.................166.7540 ms (ran 30 times)
2019_03 part 2.................168.1450 ms (ran 30 times)
2019_04 part 2.................221.4430 ms (ran 23 times)

Performance Results for 2015
2015_01 part 2.................0.0620 ms (ran 1000 times)
2015_01 part 1.................0.1370 ms (ran 1000 times)
2015_08 part 1.................0.3840 ms (ran 1000 times)
2015_07 part 1.................0.4720 ms (ran 1000 times)
2015_07 part 2.................0.5750 ms (ran 1000 times)
2015_08 part 2.................0.7340 ms (ran 1000 times)
2015_12 part 2.................0.7440 ms (ran 1000 times)
2015_12 part 1.................1.0290 ms (ran 1000 times)
2015_02 part 1.................1.5070 ms (ran 1000 times)
2015_16 part 1.................1.5220 ms (ran 1000 times)
2015_02 part 2.................1.5270 ms (ran 1000 times)
2015_16 part 2.................1.9240 ms (ran 1000 times)
2015_05 part 1.................2.3980 ms (ran 1000 times)
2015_14 part 1.................4.8080 ms (ran 1000 times)
2015_05 part 2.................4.9830 ms (ran 1000 times)
2015_14 part 2.................6.3230 ms (ran 791 times)
2015_03 part 1.................24.9730 ms (ran 201 times)
2015_09 part 2.................26.7830 ms (ran 187 times)
2015_09 part 1.................26.8590 ms (ran 187 times)
2015_13 part 1.................45.0630 ms (ran 111 times)
2015_10 part 1.................54.9720 ms (ran 91 times)
2015_03 part 2.................67.1450 ms (ran 75 times)
2015_11 part 1.................68.7780 ms (ran 73 times)
2015_15 part 2.................98.2080 ms (ran 51 times)
2015_18 part 2.................150.4400 ms (ran 34 times)
2015_18 part 1.................150.4470 ms (ran 34 times)
2015_15 part 1.................179.2630 ms (ran 28 times)
2015_11 part 2.................354.7860 ms (ran 15 times)
2015_06 part 1.................367.2060 ms (ran 14 times)
2015_06 part 2.................410.3130 ms (ran 13 times)
2015_13 part 2.................432.9060 ms (ran 12 times)
2015_10 part 2.................753.0260 ms (ran 7 times)
2015_04 part 1.................892.1810 ms (ran 6 times)
2015_17 part 1.................977.1880 ms (ran 6 times)
2015_17 part 2.................982.7710 ms (ran 6 times)
2015_04 part 2.................25678.8000 ms (ran 1 times)
```
</details>


<details>
<summary>Separated by year, sorted after date</summary>

```
Performance Results for 2021
2021_01 part 1.................0.1130 ms (ran 1000 times)
2021_01 part 2.................0.2270 ms (ran 1000 times)
2021_02 part 1.................0.6920 ms (ran 1000 times)
2021_02 part 2.................0.6860 ms (ran 1000 times)
2021_03 part 1.................0.2840 ms (ran 1000 times)
2021_03 part 2.................0.2110 ms (ran 1000 times)
2021_04 part 1.................2.3390 ms (ran 1000 times)
2021_04 part 2.................4.3930 ms (ran 1000 times)
2021_05 part 1.................16.5280 ms (ran 303 times)
2021_05 part 2.................14.3540 ms (ran 349 times)
2021_06 part 1.................58.2710 ms (ran 86 times)
2021_06 part 2.................0.0300 ms (ran 1000 times)

Performance Results for 2020
2020_19 part 1.................1.8400 ms (ran 1000 times)
2020_19 part 2.................2.9420 ms (ran 1000 times)
2020_20 part 1.................0.9040 ms (ran 1000 times)
2020_20 part 2.................0.0000 ms (ran 1000 times)
2020_23 part 1.................0.0210 ms (ran 1000 times)
2020_23 part 2.................2118.8860 ms (ran 3 times)
2020_24 part 1.................5.8010 ms (ran 862 times)
2020_24 part 2.................2287.7750 ms (ran 3 times)
2020_25 part 1.................58.3440 ms (ran 86 times)
2020_25 part 2.................0.0000 ms (ran 1000 times)

Performance Results for 2019
2019_01 part 1.................0.0070 ms (ran 1000 times)
2019_01 part 2.................0.0090 ms (ran 1000 times)
2019_02 part 1.................0.0170 ms (ran 1000 times)
2019_02 part 2.................45.2910 ms (ran 111 times)
2019_03 part 1.................166.7540 ms (ran 30 times)
2019_03 part 2.................168.1450 ms (ran 30 times)
2019_04 part 1.................103.1140 ms (ran 49 times)
2019_04 part 2.................221.4430 ms (ran 23 times)
2019_08 part 1.................0.9020 ms (ran 1000 times)
2019_08 part 2.................0.8410 ms (ran 1000 times)

Performance Results for 2015
2015_01 part 1.................0.1370 ms (ran 1000 times)
2015_01 part 2.................0.0620 ms (ran 1000 times)
2015_02 part 1.................1.5070 ms (ran 1000 times)
2015_02 part 2.................1.5270 ms (ran 1000 times)
2015_03 part 1.................24.9730 ms (ran 201 times)
2015_03 part 2.................67.1450 ms (ran 75 times)
2015_04 part 1.................892.1810 ms (ran 6 times)
2015_04 part 2.................25678.8000 ms (ran 1 times)
2015_05 part 1.................2.3980 ms (ran 1000 times)
2015_05 part 2.................4.9830 ms (ran 1000 times)
2015_06 part 1.................367.2060 ms (ran 14 times)
2015_06 part 2.................410.3130 ms (ran 13 times)
2015_07 part 1.................0.4720 ms (ran 1000 times)
2015_07 part 2.................0.5750 ms (ran 1000 times)
2015_08 part 1.................0.3840 ms (ran 1000 times)
2015_08 part 2.................0.7340 ms (ran 1000 times)
2015_09 part 1.................26.8590 ms (ran 187 times)
2015_09 part 2.................26.7830 ms (ran 187 times)
2015_10 part 1.................54.9720 ms (ran 91 times)
2015_10 part 2.................753.0260 ms (ran 7 times)
2015_11 part 1.................68.7780 ms (ran 73 times)
2015_11 part 2.................354.7860 ms (ran 15 times)
2015_12 part 1.................1.0290 ms (ran 1000 times)
2015_12 part 2.................0.7440 ms (ran 1000 times)
2015_13 part 1.................45.0630 ms (ran 111 times)
2015_13 part 2.................432.9060 ms (ran 12 times)
2015_14 part 1.................4.8080 ms (ran 1000 times)
2015_14 part 2.................6.3230 ms (ran 791 times)
2015_15 part 1.................179.2630 ms (ran 28 times)
2015_15 part 2.................98.2080 ms (ran 51 times)
2015_16 part 1.................1.5220 ms (ran 1000 times)
2015_16 part 2.................1.9240 ms (ran 1000 times)
2015_17 part 1.................977.1880 ms (ran 6 times)
2015_17 part 2.................982.7710 ms (ran 6 times)
2015_18 part 1.................150.4470 ms (ran 34 times)
2015_18 part 2.................150.4400 ms (ran 34 times)
```
</details>