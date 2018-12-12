cSpade + utilities
===
cSpade is a sequence mining algorithm developed by Mohammed Zaki[1]
This is a refactor of the original algorithm aiming at:
  - Fix a segmentation error when the data is huge and contraints too relaxed.
  - Remove raw pointers and global variables.
  - Combine cSpade and its utilities together. Originally, one needs to run makebin, getconf, exttpose before running cSpade
  - Remove mmap which is platform specific, clunky and does not improve performance one bit.
  - Reroute standard output to separate channels (logging, summary and mined sequences)
  - Provide hooks for other languages to wrap. The python-wrapper is here: https://github.com/fzyukio/python-cspade

Code is compatible with Mac/Linux and Windows (requires VC 2015 build tools)

#### Compile and run
Just type `make` (works with VC's `make.exe` on Windows too). The compilation should create 5 files:
  - makebin
  - getconf
  - exttpose
  - cspade
  - cspade-full

The first 4 files work in the same way as the original code.

`cspade-full` is an all-in-one solution that calls all of those routines for you. Call:

```bash
./cspade-full [arguments]
Mandatory arguments:
    -i --input </path/to/file>
    -s --support <support value>
Optional:
    -u --max-gap <value>
    -m --max-size <value>
    -m --max-len <value>

E.g.
    ./cspade-full -i zaki.txt -s 0.01 
    
```

`cspade-full` will print out the list of sequence.
To acquire other channels (summary and logger) you will need to modify the code in `main.cc`.
To print out logger, for example, add `cout << result.logger;`

#### Test
Run 
```bash
make runtest
./test
```

If everything goes right it should say `TEST PASSED`. The test runs
cspade on a pretty big transaction database (2000 lines) using a low support value
 and compare the output with what was produced by Zaki's unmodified cspade code.

#### Debug
if you use Clion then it will automatically read `CMakeLists.txt` and creates 5 targets corresponding
to 5 binary files above. You just need to change the working dir and arguments. 

#### Contribute
 - PRs welcome & appreciated


#### Known bugs
 - None, but don't set `max-size` and `max-len` too big when using a low `support` value, otherwise it might run out of memory.

 
#### Licence
MIT

[1] Mohammed J. Zaki, Sequences Mining in Categorical Domains: Incorporating Constraints.
    In 9th ACM International Conference on Information and Knowledge Management. Nov 2000.