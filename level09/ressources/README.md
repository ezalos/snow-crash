# Level07

## Context
We found `level09` executable file and ```token``` file in our home.
If we don't give or give more than 1 argument, ```./level09``` outputs ```You need to provied only one arg.```
When launched with argument ```token```, it outputs: ```tpmhr```
When we do ```cat token```, it outputs: ```f4kmm6p|=�p�n��DB�Du{��``` 

## Resolution
 * it looks like ```level09``` program take the string passed in argument, and add to each ascii value of the characters its index in the string. For example, ```token``` becomes ```t+0 o+1 k+2, e+3 n+4```, that is to say ```tpmhr``` 
 * we can go back to the initial value of the content of ```token```
 * for that we use the C script ```script.c``` that you can find in the same folder
 * we first download the ```token``` file; ```scp -P 4242 level09@$(VM_IP):~/token .```
 * after compiling the script, we can launch ```./a.out token``` and get the ```flag09``` user token.