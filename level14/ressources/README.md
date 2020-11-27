# Level14

## Context
We found an empty home. Time to hack getflag itself !


## Resolution
 * launch `gdb getflag`
 * `b ptrace`
 * `b getuid`
 * `r`
 * `print *eax = 0` allows to change return of ptrace to 0, as if we didnt used a debugger.
 * `c`
 * `print *eax = 3014` change return of getuid to appear to be user flag14
 * `c` code can continue to execute, we will get the final flag
