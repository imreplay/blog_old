---
title: "[Pwnable.kr] Toddler's Bottle - flag 풀이"
excerpt: "pwnable.kr flag 풀이"
categories: 
  - Wargame
tags: 
  - system
  - Pwnable.kr
last_modified_at: 2018-07-15T22:45:00+09:00
---

문제

```
Papa brought me a packed present! let's open it.

Download : http://pwnable.kr/bin/flag

This is reversing task. all you need is binary
```

문제 파일은 http://pwnable.kr/bin/flag 에서 다운로드 받을 수 있다.

어떤 파일인지 간단하게 확인해 보자.

```
$ file flag
flag: ELF 64-bit LSB  executable, x86-64, version 1 (GNU/Linux), statically linked, stripped
```
ELF파일 포맷을 가지고 있는 실행파일인 것 같다. 

문제에서 packed 선물을 사주었다고 하는 것을 보니 패킹된 파일 인 듯 하다.

일단 gdb에서 확인해 보려했지만, 분석을 하지 못한다.

strings 명령어를 통해 내부 문자열을 확인해보았다. 

```
~~ 중략 ~~

$Info: This file is packed with the UPX executable packer http://upx.sf.net $
$Id: UPX 3.08 Copyright (C) 1996-2011 the UPX Team. All Rights Reserved. $

~~ 중략 ~~
```

UPX 패킹이 되어있는 것 같다.

upx 도구를 다운 받아서 decompress를 해주었다.

```
./upx -d ../flag -o ../d_flag
                       Ultimate Packer for eXecutables
                          Copyright (C) 1996 - 2017
UPX 3.94        Markus Oberhumer, Laszlo Molnar & John Reiser   May 12th 2017

        File size         Ratio      Format      Name
   --------------------   ------   -----------   -----------
    883745 <-    335288   37.94%   linux/amd64   d_flag

Unpacked 1 file.
```

이제 gdb를 통해 다시 확인 해보자.

```
# gdb d_flag -q
Reading symbols from d_flag...(no debugging symbols found)...done.
gdb-peda$ pdisas main
Dump of assembler code for function main:
   0x0000000000401164 <+0>:     push   rbp
   0x0000000000401165 <+1>:     mov    rbp,rsp
   0x0000000000401168 <+4>:     sub    rsp,0x10
   0x000000000040116c <+8>:     mov    edi,0x496658
   0x0000000000401171 <+13>:    call   0x402080 <puts>
   0x0000000000401176 <+18>:    mov    edi,0x64
   0x000000000040117b <+23>:    call   0x4099d0 <malloc>
   0x0000000000401180 <+28>:    mov    QWORD PTR [rbp-0x8],rax
   0x0000000000401184 <+32>:    mov    rdx,QWORD PTR [rip+0x2c0ee5]        # 0x6c2070 <flag>
   0x000000000040118b <+39>:    mov    rax,QWORD PTR [rbp-0x8]
   0x000000000040118f <+43>:    mov    rsi,rdx
   0x0000000000401192 <+46>:    mov    rdi,rax
   0x0000000000401195 <+49>:    call   0x400320
   0x000000000040119a <+54>:    mov    eax,0x0
   0x000000000040119f <+59>:    leave
   0x00000000004011a0 <+60>:    ret
End of assembler dump.
gdb-peda$ x/s *0x6c2070
0x496628:       "UPX...? sounds like a delivery service :)"
gdb-peda$
```

x/s 를 통해 flag라고 적혀있는 부분의 문자열을 읽어왔다.


