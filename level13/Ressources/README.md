# Level13

## Context
We found `level13` executable file in our home.
When executed, this program outputs: ```UID 2013 started us but we we expect 4242```

## Resolution
 * the disassembled program allows to see that a check is done on the UID before going further. As expected, if the user is not ```4242```, the program exits.
 * using ```gdb peda```, we skip the id check part to go directly to the call of ```ft_res``` function
 * this function takes as input the following string, stored in the ```.rodata``` section: ```boe]!ai0FB@|L6l@.:A?>qJ}I```
 * this function outputs the decoded token (as you can see in the screenshot)