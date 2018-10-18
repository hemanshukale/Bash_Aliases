# Bash_Aliases
Hi all,
This is a list of aliases and functions, mainly useful for the lazies (Linux-Ubuntu)..

Alias is an alias for the command shortcuts in bash.. without which life would've been a hell for a lot of linux users.

The world of alaises and aliases function offers a lot of potential for the impatient and the lazy ones.

Here is a list of aliases I've made and constantly updated over years, addressing some general and some very specific uses..
I've commented and explained in short all the major commands. In case of some mistakes or unclearity, feel free to ping at hemanshu.kale@gmail.com or to raise issue..  
Efforts were taken so that no command would confilct with any existing commands in the major packages... In case of any conflicts, you can change the corresponding alias.

You just need to open up the alias file and copy-paste all the commands you find useful


## Steps

1. After opening terminal, open up the **'.bash_aliases'** file in your home directory...  you can use the nano editor: **'nano ~/.bash_aliases'**  
2. You can copy paste the entire contents of the file into your file.. if you don't want to do this at first, start by copying some simple commands.. one of the most useful I find is: **alias alia='nano ~/.bash_aliases'** as then, to add any new alias, just have to type in **alia**..  
3. Then, save and exit with 'Control+X' , 'y', 'Enter'  
4. After saving the file, you cannot directly start using the aliases in the current terminal session...
            you either have to open another terminal session or type in: **'source ~/.bashrc'**
            this reloads/refreshes the aliases from the alias file (there is also an alias for this command - **ref**)
            
## Functions

You can also give in arguements to commands which removes the needs for making different alises for small changes in some parameters..  
Ex.: You can store up a formula in a command (function)
these are 2 such functions ->   
fdc: alias for converting Fahrenheit to Celsius  
cdf: alias for converting Celsius to Fahrenheit  
$1 is the first argument after the function...  
ex. if **foo** is a function, and you call it with: **foo 12 ab 64**, then **$1** will be **12**, **$2** will be **ab** and **$3** will be **64**  

cdf(){  
&nbsp;&nbsp;&nbsp;&nbsp; ((a=$1*9/5))  
&nbsp;&nbsp;&nbsp;&nbsp; ((b=$a+32))  
&nbsp;&nbsp;&nbsp;&nbsp; echo $b  
}  
  
fdc(){  
&nbsp;&nbsp;&nbsp;&nbsp; ((a=$1-32))  
&nbsp;&nbsp;&nbsp;&nbsp; ((b=$a*5/9))  
&nbsp;&nbsp;&nbsp;&nbsp; echo $b  
}  

Usage:  
fdc 212:  prints 100  
fdc 32:   prints 0  
cdf 50:   prints 122  
cdf -40:  prints -40  

