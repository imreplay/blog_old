---
title: "[Webhacking.kr] 4번(150) 문제 풀이"
categories: 
  - Wargame
tags: 
  - web
  - webhackinag.kr
last_modified_at: 2018-10-06T23:08:00+09:00
---

### 4번 문제 풀이

`YzQwMzNiZmY5NGI1NjdhMTkwZTMzZmFhNTUxZjQxMWNhZWY0NDRmMg==`

Base64 느낌이 물씬 나는 문자열이다. 

디코딩을 해보자.

`c4033bff94b567a190e33faa551f411caef444f2`

16진수 40글자로 이루어진 해시 sha1으로 추정 된다.

> md5는 32글자 / sha256은 64글자이다.

다시한번 디코딩을 시도해보자.

`a94a8fe5ccb19ba61c4c0873d391e987982fbbd3`

이번에도 40글자! 다시 한 번 디코딩을 시도하자.

	
결과로 나온 값이 정답이다.

끝.