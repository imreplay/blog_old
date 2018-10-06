---
title: "[Webhacking.kr] 18번(100) 문제 풀이"
categories: 
  - Wargame
tags: 
  - web
  - webhackinag.kr
last_modified_at: 2018-10-06T23:45:00+09:00
---

### 18번 문제 풀이

소스코드를 제공해준다 확인해보자.

```html
<html> 
<head> 
<title>Challenge 18</title> 
<style type="text/css"> 
body { background:black; color:white; font-size:10pt; } 
input { background:silver; } 
a { color:lightgreen; } 
</style> 
</head> 
<body> 
<br><br> 
<center><h1>SQL INJECTION</h1> 
<form method=get action=index.php> 
<table border=0 align=center cellpadding=10 cellspacing=0> 
<tr><td><input type=text name=no></td><td><input type=submit></td></tr> 
</table> 
</form> 
<a style=background:gray;color:black;width:100;font-size:9pt;><b>RESULT</b><br> 
<? 
if($_GET[no]) 
{ 

if(eregi(" |/|\(|\)|\t|\||&|union|select|from|0x",$_GET[no])) exit("no hack"); 

$q=@mysql_fetch_array(mysql_query("select id from challenge18_table where id='guest' and no=$_GET[no]")); 

if($q[0]=="guest") echo ("hi guest"); 
if($q[0]=="admin") 
{ 
@solve(); 
echo ("hi admin!"); 
} 

} 

?> 
</a> 
<br><br><a href=index.phps>index.phps</a> 
</cener> 
</body> 
</html> 
```


자세히 살펴봐야 할부분을 다시 추려본다면


```php
if(eregi(" |/|\(|\)|\t|\||&|union|select|from|0x",$_GET[no])) exit("no hack"); 

$q=@mysql_fetch_array(mysql_query("select id from challenge18_table where id='guest' and no=$_GET[no]")); 

if($q[0]=="guest") echo ("hi guest"); 
if($q[0]=="admin") 
{ 
@solve(); 
echo ("hi admin!"); 
} 
```

이정도가 될것이다.

`select id from challenge18_table where id='guest' and no=$_GET[no]` 이 구문에 SQL 인젝션을 넣어주면 되겠다.

필터링 되는 문자열은 " "(공백) , "/" , "(", ")", 탭 문자, "|", "$", "union", "select", "from", "0x" 이다. 