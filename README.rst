======  =========  ========   ========  =======  =======  =======
lang    CPU in s                        RAM
        real       user       sys       USS      PSS      RSS
======  =========  ========   ========  =======  =======  =======
bash      17.771     12.972     2.272       232      432     2956
tcl        5.437      1.844     1.752      1252     1850     4676
java       4.996      1.452     1.884     48688    52416    59004
ruby       4.333      1.184     1.500      6988     7101     9072
luac       3.567      0.648     1.352       512      526     1888
lua        3.544      0.600     1.356       508      523     2020
pyc        3.478      0.492     1.412      2544     3424     6544
python     3.347      0.572     1.296      2560     3422     6556
perl       3.060      0.308     1.276      1868     1972     3848
rust       2.839      0.260     1.204       508      550     2268
C          2.448      0.092     1.160       484      527     2220
asm        2.492      0.088     1.160        16       16       16
======  =========  ========   ========  =======  =======  =======

USS - unshared
PSS - proportional
RSS - resident/non-swapped (including shared memory!)