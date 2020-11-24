# Level03

## Context
We found `level03` in our home. When executed, this file outputs the following: ```Exploit me```

## Resolution
 * shell command ```ls -l``` outputs the following:
 ```-rwsr-sr-x 1 flag03 level03 8627 Mar  5  2016```
 * char ```s``` at the 4th position indicates that the file is setuid and can be executed as flag03 user.
 * flag03 user is able to launch the ```getflag``` command that will allow us to go to the next level.
 * Reading the binary file ```level03``` with commands ```objdump -d -j .rodata ~/level03``` and ```objdump -d ~/level03``` shows that libc function ```system``` is used to launch command ```/usr/bin/env echo exploit me```.
 * Our goal is then to  use ```level03``` file to launch getflag command.
 * As we can't create a bash alias (we don't have write permissions on our HOME), we create a file called ```echo```, that contains ```getflag``` command and we put it in ```/var/crash``` folder (we have read and write permissions on this folder).
 * We add this folder to the path: ```export PATH=/var/crash:$PATH```
 * ```./level03``` now outputs the flag allowing us to go to the next level.


 