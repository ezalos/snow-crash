# level00

## README
```
FIND this first file who can run only as flag00...
```

## Solution

 * Find all files which are from group flag00
   * `find / -group flag00 2>&-`
   * out > 
   ```
	/usr/sbin/john
	/rofs/usr/sbin/john
   ```
 * Get the content of 1st match
   * `find / -group flag00 -exec cat {} \; -quit 2>&-`
   * out > `cdiiddwpgswtgt`
 * It's a caesar cypher, with rot 15 (you can check it on dcode)
   * `nottoohardhere`
