# Level11

## Context
We found `level11` executable file in our home, whose user is ```flag11```.
This program is a lua server that listens on 127.0.0.1:5151, and hashes client input ```pass``` using ```prog = io.popen("echo "..pass.." | sha1sum", "r")```
When launched, this program outputs:
```
lua: ./level11.lua:3: address already in use
stack traceback:
	[C]: in function 'assert'
	./level11.lua:3: in main chunk
	[C]: ?
```

## Resolution
 * Launching ```find / -name "*level11*"``` outputs ```/etc/init.d/level11_start```, in which we can see that ```level11``` is already running as a deamon. 
 * ```io.popen``` is a function that executes the command passed in argument : we will use it to execute a command as ```flag11``` user
 * We launch the script ```client.lua``` that will pass ``` `getflag > /var/crash/output.txt` ``` in argument to the hash function.
 * The flag is now in ```/var/crash/output.txt```.