---
title: "[Pwnable.kr] Toddler's Bottle - fd 풀이"
excerpt: "pwntools를 사용한 fd 풀이"
categories: 
  - Wargame
tags: 
  - system
  - Pwnable.kr
last_modified_at: 2018-07-10T10:30:00+09:00
---

문제

### fd.c

```c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
char buf[32];
int main(int argc, char* argv[], char* envp[]){
        if(argc<2){
                printf("pass argv[1] a number\n");
                return 0;
        }
        int fd = atoi( argv[1] ) - 0x1234;
        int len = 0;
        len = read(fd, buf, 32);
        if(!strcmp("LETMEWIN\n", buf)){
                printf("good job :)\n");
                system("/bin/cat flag");
                exit(0);
        }
        printf("learn about Linux file IO\n");
        return 0;

}
```

먼저 문제 제목인 `fd`의 의미에 대해 생각해보도록 하자.

아마 '파일 디스크럽터'에 대한 문제일 것이다.

`read` 함수를 사용할 때

```c
read(int fd, void *buf, size_t count)
```
위와 같은 형태로 사용한다.

`fd` 의 값은 아래 표와 같이 결정 되어진다.

| fd  | 처리방법 |
|:---:|:-------:|
| 0   | 표준 입력(stdin)  |
| 1   | 표준 출력(stdout) |
| 2   | 표준 에러(stderr) |

문제에서 `buf`와 `"LETMEWIN"`문자열을 비교하는 부분이 있으므로 `fd` 값을 0으로 만들어 표준입력으로 값을 입력시켜주어야 한다.

매개변수로 `0x1234 == 4660` 를 넘겨주고 문자열 `LETMEWIN` 을 입력해주면 flag 가 나올 것이다!

```
fd@ubuntu:~$ ./fd 4660
LETMEWIN
good job :)
{여기에 Flag가 출력됩니다.}
```

python과 pwntools 모듈을 사용하여 풀이 또한 가능하다.

### fd_payload.py
{% gist imreplay/87cd0362c609c27c48873d88591474f0 %}
