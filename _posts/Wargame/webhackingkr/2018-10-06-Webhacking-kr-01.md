---
title: "[Webhacking.kr] 1번(200) 문제 풀이"
categories: 
  - Wargame
tags: 
  - web
  - webhackinag.kr
last_modified_at: 2018-10-06T19:20:00+09:00
---

### 1번 문제 풀이

```
---------------------

level : 1
----- index.phps -----
```

index.phps로 접속해본다.

~~클릭만 해도 들어가지네 띠용..~~

```php
<?
if(!$_COOKIE[user_lv])
{
SetCookie("user_lv","1");
echo("<meta http-equiv=refresh content=0>");
}
?>
<html>
<head>
<title>Challenge 1</title>
</head>
<body bgcolor=black>
<center>
<br><br><br><br><br>
<font color=white>
---------------------<br>
<?

$password="????";

if(eregi("[^0-9,.]",$_COOKIE[user_lv])) $_COOKIE[user_lv]=1;

if($_COOKIE[user_lv]>=6) $_COOKIE[user_lv]=1;

if($_COOKIE[user_lv]>5) @solve();

echo("<br>level : $_COOKIE[user_lv]");

?>
<br>
<pre>
<a onclick=location.href='index.phps'>----- index.phps -----</a>
</body>
</html>
```

`index.php` 의 소스코드를 확인할 수 있다. 

천천히 읽어보면 `user_lv`쿠기가 없을 경우 쿠키 값을 1로 설정한다.

그 후 쿠키값을 검사한다.

5보다 커야 문제가 풀리지만

`user_lv` 값이 1이거나 6 이상이면 안된다고 한다.

5.5를 넣어줘 버리자.

크롬 개발자 도구에서 

`document.cookie = "user_lv=5.5";`를 입력 한 후 

새로 고침을 눌러주면 끝.
