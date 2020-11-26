# Level07

## Context
We found `level07` in our home. When executed, this file outputs the following: ```level07```

## Resolution
 * shell command ```ls -l``` outputs the following:
 ```-rwsr-sr-x 1 flag07 level07 8805 Mar  5  2016 level07```
 * char ```s``` at the 4th position indicates that the file is setuid and can be executed as flag07 user.
 * flag07 user is able to launch the ```getflag``` command that will allow us to go to the next level.
 * Executing the file with gdb-peda allows us to see that libc function ```getenv``` is used to get the value of ```LOGNAME``` variable, that is actually set to ```level07``` (see ```screen_1```).
 * Then ```asprintf``` function is used to allocate memory for an instruction that will be then passed to ```system``` function (see ```screen_3```).
 * This instruction is ```/bin/echo %s``` (see ```screen_2```).
 * We modify the env variable LOGNAME as so: ```export LOGNAME="hello && sh -c getflag"```
 * then we launch ```./level07``` and get the flag.