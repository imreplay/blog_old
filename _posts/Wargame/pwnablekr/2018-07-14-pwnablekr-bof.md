---
title: "[Pwnable.kr] Toddler's Bottle - bof 풀이"
excerpt: "pwntools를 사용한 bof 풀이"
categories: 
  - Wargame
tags: 
  - system
  - Pwnable.kr
last_modified_at: 2018-07-14T23:11:00+09:00
---

문제

### bof.c

```c
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
void func(int key){
        char overflowme[32];
        printf("overflow me : ");
        gets(overflowme);       // smash me!
        if(key == 0xcafebabe){
                system("/bin/sh");
        }
        else{
                printf("Nah..\n");
        }
}
int main(int argc, char* argv[]){
        func(0xdeadbeef);
        return 0;
}
```

`gets` 함수를 통해 문자열을 입력받지만 길이를 체크하지 않는다.

`key`를 0xcafebabe 로 덮어씌우면 해결할 수 있는 문제이다.

"a"문자열을 32개부터 한개씩 늘려가며 뒤에 0xcafebabe를 붙이는 방법으로 풀이하였다.

풀이 후 colorama를 사용하는 방법을 알게 되어 해당 방법으로 하이라이팅도 해보았다.

### bof_payload.py

{% gist imreplay/a523532bd5a1d240ff6d00c9d62505b0 %}

두번째 파일의 실행결과는 다음과 같다.

![image](/assets/img/pwnable/bof_color.png)


