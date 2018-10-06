---
title: "[Webhacking.kr] 3번(350) 문제 풀이"
categories: 
  - Wargame
tags: 
  - web
  - webhackinag.kr
last_modified_at: 2018-10-06T22:50:00+09:00
---

### 3번 문제 풀이

문제를 클릭해서 접속하게되면 다음과 같은 화면을 볼 수 있다.

![quest](/assets/img/webhacking/web-03.jpg)

어릴 적 풀던 네모로직과 비슷해보이니 풀어서 `gogo` 버튼을 눌러 다음 페이지로 이동한다.

![name](/assets/img/webhacking/web-03-1.jpg)

이름을 입력할 수 있는 부분이 나온다. 입력하고 write 해 보자.

![name](/assets/img/webhacking/web-03-2.jpg)

결과가 썩 맘에 들지는 않는다..

내가 입력한 `admin` 이라는 단어는 name 부분에 들어가 있고, 입력한 적이 없는 1010..부분은 answer 부분에 들어가 있다.

다시 값을 입력하는 부분으로 돌아와서 소스를 한번 살펴보자.

```html
<html>
<head>
<title>Challenge 3</title>
</head>
<body>
<center>Puzzle</center>
<p>
<hr>

<form name=kk method=get action=index.php>

</form>

<form method=post action=index.php>
<input type=hidden name=answer value=1010100000011100101011111>
name : 
<input type=text name=id maxlength=10 size=10>
<input type=submit value='write'>
```
음... answer라는 값이 1010100000011100101011111 로 고정되어있고

이름을 입력해서 전달했을 때 answer부분에 들어갈 내용인 것 같다.

개발자 도구를 통해 value="1010100000011100101011111**or1**" 로 뒤에 or 1을 추가해 주었다.

![or1](/assets/img/webhacking/web-03-3.jpg)

**no hack** 이라는 경고를 띄우는 것으로 보아 정답에 어느 정도 가까워진 느낌이다.

다시 이전 페이지로 돌아가서 

value 값으로 "1010100000011100101011111**\|\|1**" 을 설정해 준후 제출해보았다.

![clear](/assets/img/webhacking/web-03-4.jpg)

끝.