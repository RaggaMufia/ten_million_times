Benchmarks for different languages
==================================

We benchmark here for a few languages the CPU usage
in seconds of:

* printing 'hello' 10Mio times
* printing 'hello' 10Mio times without actually
  displaying it
* incrementing an integer 10Mio times
* starting up a program

We also have a look at the size of the executable
and the memory usage.

Languages looked at:

* Assembler
* C
* Rust
* Perl
* Python Compiled
* Python
* Lua
* Ruby
* Java
* Tcl
* Bash
 
Platform is some quite powerful Linux laptop with
lots of RAM bought in 2012.


Memory usage for "print hello 10'000'000 times"
-----------------------------------------------

* as measured by smem

======  =======  =======  =======
lang    USS      PSS      RSS
======  =======  =======  =======
java      48688    52416    59004
ruby       6988     7101     9072
python     2560     3422     6556
pyc        2544     3424     6544
perl       1868     1972     3848
tcl        1252     1850     4676
luac        512      526     1888
lua         508      523     2020
rust        476      509     2260
C           484      527     2220
bash        232      432     2956
asm          16       16       16
======  =======  =======  =======

USS - unshared
PSS - proportional
RSS - resident/non-swapped (including shared memory!)


Executable sizes for "print hello 10'000'000 times"
---------------------------------------------------

* as measured by ls
* "rust" is statically linked (default)
* "rust dyn" is with dynamic linking
  (``rustc -C prefer-dynamic``)
* in bytes

========  =============
lang      size in bytes
========  =============
rust             650192 
rust dyn           9880  
C                  6720
asm                 608
java                470
tcl                 181
pyc                 172
bash                142
perl                 90
lua                  81
python               77
ruby                 54
========  =============


Execution time for hello with output
------------------------------------

======   =======   =======   =======
lang        real      user       sys
======   =======   =======   =======
asm       27.095     1.000    12.060
c         28.911     1.112    12.756
rs        30.812     2.396    13.060
pl        34.397     3.824    14.032
pyc       35.823     5.048    14.288
py        36.752     5.376    14.540
lua       37.407     5.648    14.696
rb        44.352    10.908    15.948
java      50.406    10.976    19.436
tcl       60.283    20.432    19.404
sh       188.551   137.204    23.740
======   =======   =======   =======

* comparing with the next benchmark one
  would think most of the time is spent
  rendering the output


Execution time for hello without output
---------------------------------------

======   =======   =======   =======
lang        real      user       sys
======   =======   =======   =======
asm        3.302     1.444     1.856
c          0.275     0.268     0.004
rs         2.821     1.840     0.976
pl         1.865     1.860     0.004
pyc        3.133     3.128     0.000
py         3.009     3.004     0.004
lua        5.271     4.112     1.156
rb         3.564     3.556     0.004
java      12.668    10.644     2.516
tcl       15.806    14.140     1.660
sh       125.883   123.992     1.852
======   =======   =======   =======


Execution time for increment 
----------------------------

======   =======   =======   =======
lang        real      user       sys
======   =======   =======   =======
asm        0.057     0.056     0.000
c          0.027     0.024     0.000
rs         0.046     0.044     0.000
pl         0.992     0.988     0.000
pyc        0.816     0.812     0.000
py         0.755     0.752     0.000
lua        0.942     0.940     0.000
rb         0.260     0.252     0.004
java       0.156     0.144     0.020
tcl        7.464     7.460     0.000
sh        90.468    90.436     0.000
======   =======   =======   =======


Execution time for startup and shutdown
---------------------------------------

======   =======   =======   =======
lang        real      user       sys
======   =======   =======   =======
asm        0.000     0.000     0.000
c          0.001     0.000     0.000
rs         0.001     0.000     0.000
pl         0.003     0.004     0.000
pyc        0.018     0.012     0.004
py         0.026     0.024     0.000
lua        0.002     0.000     0.000
rb         0.042     0.036     0.004
java       0.076     0.072     0.004
tcl        0.004     0.000     0.004
sh         0.002     0.000     0.000
======   =======   =======   =======

