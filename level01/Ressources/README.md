# level00

## Context
'''
No README file this time.
But in the /etc/passwd file, we can see the following:
```flag01:42hDRfypTqqnw:3001:3001::/home/flag/flag01:/bin/bash```
It seems that we have a hash for flag01 password....

## Solution

 * Download John the Ripper
 * Launch the following command to download on your host /etc/passwd/file :
 ```
 scp -P 4242 level01@$(VM_IP):/etc/passwd .
 ```
 * Crack the password with John the ripper:
 ```
 john --show passwd 
 ```
 * Get the decoded password:
 ```
 flag01:abcdefg:3001:3001::/home/flag/flag01:/bin/bash

1 password hash cracked, 0 left
```
