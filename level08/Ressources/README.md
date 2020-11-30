# Level06

## Context
Content of `/home/user/level08` :
```
total 16
-rwsr-s---+ 1 flag08 level08 8617 Mar  5  2016 level08
-rw-------  1 flag08 flag08    26 Mar  5  2016 token
```


## Resolution
 * Usage of `level08` shows us it will print content of a file
   ```
   ./level08 
   ./level08 [file to read]
   ```
 * We observe that the binary 'level08' has suid rights, and is part of the flag06 group.
We cant read ourselves the token file, but level08 executable can.
 * When given token as an argument we get the following error:
 ```
 ~/level08 ~/token 
You may not access '/home/user/level08/token'
 ```
 * We give it a look in gdb, and see it's because of use of strstr(), which looks for `token` in the file name. We put a screenshot in the ressources folder..
 * We can easily solve this. Let's create symbolic link with a different name and use it as argument !
 ```
 ln -s ~/token /var/crash/bg_du_89
~/level08 /var/crash/bg_du_89
quif5eloekouj29ke0vouxean
```
