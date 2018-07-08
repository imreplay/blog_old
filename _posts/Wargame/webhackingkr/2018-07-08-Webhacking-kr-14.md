---
title: "[Webhacking.kr] 14번(100) 문제 풀이"
categories: 
  - Wargame
tags: 
  - web
  - webhackinag.kr
last_modified_at: 2018-07-08T22:53:00+09:00
---

문제를 보면 입력박스 한개, 체크버튼 한개가 보인다.

소스코드를 확인해 보자.

그렇게 길지 않아서 전문을 첨부하였다.

```html
<html>
<head>
<title>Challenge 14</title>
<style type="text/css">
body { background:black; color:white; font-size:10pt; }
</style>
</head>
<body>
<br><br>
<form name=pw><input type=text name=input_pwd><input type=button value="check" onclick=ck()></form>
<script>
function ck()
{
var ul=document.URL;
ul=ul.indexOf(".kr");
ul=ul*30;
if(ul==pw.input_pwd.value) { alert("Password is "+ul*pw.input_pwd.value); }
else { alert("Wrong"); }
}

</script>


</body>
</html>
```

여기서 주의깊게 봐야할 곳은 이부분이다.

```html
<script>
function ck()
{
var ul=document.URL;
ul=ul.indexOf(".kr");
ul=ul*30;
if(ul==pw.input_pwd.value) { alert("Password is "+ul*pw.input_pwd.value); }
else { alert("Wrong"); }
}

</script>
```

`ul`에 `document.URL`을 저장한다.

그 후 `ul`에서 `".kr"`의 위치를 찾아 인덱스를 저장한다.

다음으로 그 값에 30을 곱하고, 제출한 값과 일치하면 성공!

alert으로 `ul`과 입력한 값을 곱한것이 패스워드 일 것이다.

직접 계산하긴 귀찮으니 저 코드를 콘솔에 실행시켜보자.

```js
var ul=document.URL;
ul=ul.indexOf(".kr");
ul=ul*30;

# 출력부분 추가

console.log(ul);
```
마지막에 `console.log(ul)` 을 추가해서 비교 전 `ul`의 값을 확인하였다.

결과값을 보니 `510` 이다.

`if(ul==pw.input_pwd.value) { alert("Password is "+ul*pw.input_pwd.value); }` 부분에서 `ul` 과 패스워드로 입력한 값이 같을 때 `ul`을 입력값과 곱한다고 했는데

생각해보니 `ul * ul` 이다. 

510의 제곱 값을 `Auth` 부분에 입력 후 문제 풀이 끝




