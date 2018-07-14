---
title: "[Pwnable.kr] Toddler's Bottle - collision 풀이"
excerpt: "pwntools를 사용한 collision 풀이"
categories: 
  - Wargame
tags: 
  - system
  - Pwnable.kr
last_modified_at: 2018-07-14T09:20:00+09:00
---

문제

### col.c

```c
#include <stdio.h>
#include <string.h>
unsigned long hashcode = 0x21DD09EC;
unsigned long check_password(const char* p){
        int* ip = (int*)p;
        int i;
        int res=0;
        for(i=0; i<5; i++){
                res += ip[i];
        }
        return res;
}

int main(int argc, char* argv[]){
        if(argc<2){
                printf("usage : %s [passcode]\n", argv[0]);
                return 0;
        }
        if(strlen(argv[1]) != 20){
                printf("passcode length should be 20 bytes\n");
                return 0;
        }

        if(hashcode == check_password( argv[1] )){
                system("/bin/cat flag");
                return 0;
        }
        else
                printf("wrong passcode.\n");
        return 0;
}
```

코드 흐름을 살펴보면 20바이트 입력을 argv로 받은 후 hashcode와 check_password(argv[1]) 값이 같으면 flag를 보여준다

check_password는 20바이트 입력받은 문자열을 4바이트씩 int로 읽어들여 res에 5번 더한 후 res를 반환해 준다.

반환받은 res 의 값은 `0x21DD09EC` 이 되어야 하고 이 값은 4바이트씩 읽어들인 값을 5번 더했을 때의 값이니 `0x21DD09EC`를 5로 나누어서 5번 더하면 된다.

정확히 나누어떨어지는 게 아니므로 4번 더한후 마지막에 나머지를 더한값을 더해주면 된다.


### col_payload.py

{% gist imreplay/56a2173d5551f0044b03db53752bbb87 %}

