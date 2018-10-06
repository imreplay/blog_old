---
title: "[Webhacking.kr] 5번(300) 문제 풀이"
categories: 
  - Wargame
tags: 
  - web
  - webhackinag.kr
last_modified_at: 2018-10-06T19:29:00+09:00
---

### 5번 문제 풀이

문제 페이지에 접속하면 `Login` 버튼과 `Join` 버튼이 보인다.

Join 버튼을 눌러보니 `Access_Denied` 라는 메시지가 뜬다.

뭐.. 급할수록 돌아가라는 말도 있으니 로그인 페이지 부터 확인하자.

`http://webhacking.kr/challenge/web/web-05/mem/login.php` 주소로 이동하는 것을 볼 수 있다.

login.php를 join.php로 바꾼다면..?!

검은색 화면만 보인다.

뭔가 있을 것 같으니 페이지 소스를 살펴보자.

```html

<html>
<title>Challenge 5</title></head><body bgcolor=black><center>
<script>
l='a';ll='b';lll='c';llll='d';lllll='e';llllll='f';lllllll='g';llllllll='h';lllllllll='i';llllllllll='j';lllllllllll='k';llllllllllll='l';lllllllllllll='m';llllllllllllll='n';lllllllllllllll='o';llllllllllllllll='p';lllllllllllllllll='q';llllllllllllllllll='r';lllllllllllllllllll='s';llllllllllllllllllll='t';lllllllllllllllllllll='u';llllllllllllllllllllll='v';lllllllllllllllllllllll='w';llllllllllllllllllllllll='x';lllllllllllllllllllllllll='y';llllllllllllllllllllllllll='z';I='1';II='2';III='3';IIII='4';IIIII='5';IIIIII='6';IIIIIII='7';IIIIIIII='8';IIIIIIIII='9';IIIIIIIIII='0';li='.';ii='<';iii='>';lIllIllIllIllIllIllIllIllIllIl=lllllllllllllll+llllllllllll+llll+llllllllllllllllllllllllll+lllllllllllllll+lllllllllllll+ll+lllllllll+lllll;
lIIIIIIIIIIIIIIIIIIl=llll+lllllllllllllll+lll+lllllllllllllllllllll+lllllllllllll+lllll+llllllllllllll+llllllllllllllllllll+li+lll+lllllllllllllll+lllllllllllllll+lllllllllll+lllllllll+lllll;if(eval(lIIIIIIIIIIIIIIIIIIl).indexOf(lIllIllIllIllIllIllIllIllIllIl)==-1) { bye; }if(eval(llll+lllllllllllllll+lll+lllllllllllllllllllll+lllllllllllll+lllll+llllllllllllll+llllllllllllllllllll+li+'U'+'R'+'L').indexOf(lllllllllllll+lllllllllllllll+llll+lllll+'='+I)==-1){alert('access_denied');history.go(-1);}else{document.write('<font size=2 color=white>Join</font><p>');document.write('.<p>.<p>.<p>.<p>.<p>');document.write('<form method=post action='+llllllllll+lllllllllllllll+lllllllll+llllllllllllll+li+llllllllllllllll+llllllll+llllllllllllllll
+'>');document.write('<table border=1><tr><td><font color=gray>id</font></td><td><input type=text name='+lllllllll+llll+' maxlength=5></td></tr>');document.write('<tr><td><font color=gray>pass</font></td><td><input type=text name='+llllllllllllllll+lllllllllllllllllllllll+' maxlength=10></td></tr>');document.write('<tr align=center><td colspan=2><input type=submit></td></tr></form></table>');}
</script>
</body>
</html>
```
아주 많은 `l`들로 이루어진 코드가 보인다.

쭈욱 살펴보니 변수를 정의하는 부분 밑에 if문을 볼 수 있다.

```js
if(eval(lIIIIIIIIIIIIIIIIIIl).indexOf(lIllIllIllIllIllIllIllIllIllIl)==-1) { bye; }

if(eval(llll+lllllllllllllll+lll+lllllllllllllllllllll+lllllllllllll+lllll+llllllllllllll+llllllllllllllllllll+li+'U'+'R'+'L').indexOf(lllllllllllll+lllllllllllllll+llll+lllll+'='+I)==-1){alert('access_denied');history.go(-1);}

else
{document.write('<font size=2 color=white>Join</font><p>');document.write('.<p>.<p>.<p>.<p>.<p>');document.write('<form method=post action='+llllllllll+lllllllllllllll+lllllllll+llllllllllllll+li+llllllllllllllll+llllllll+llllllllllllllll
+'>');document.write('<table border=1><tr><td><font color=gray>id</font></td><td><input type=text name='+lllllllll+llll+' maxlength=5></td></tr>');document.write('<tr><td><font color=gray>pass</font></td><td><input type=text name='+llllllllllllllll+lllllllllllllllllllllll+' maxlength=10></td></tr>');document.write('<tr align=center><td colspan=2><input type=submit></td></tr></form></table>');}
```

처음 join페이지에 들어갔을 때 `access_denied` 메시지를 볼 수 있었으므로 저 if문에 걸렸다고 생각 할 수 있다.

else문 뒤에 부분을 실행 시켜주면, join 폼을 볼 수 있다.

admin으로 회원가입하고 로그인해야지!

`id 'admin' is already exists`

으잉??

입력 칸은 5글자로 제한되어있어서 뒤에 문자를 더 넣을수도 없다

뭐 바꾸면 되는거 아니겠는가. 세상에 불가능은 없다고 하니

```html
<form method="post" action="join.php">
  <table border="1">
    <tbody>
    <tr>
      <td><font color="gray">id</font></td>
      <td><input type="text" name="id" maxlength="5"></td>
    </tr>

    <tr>
      <td><font color="gray">pass</font></td>
      <td><input type="text" name="pw" maxlength="10"></td>
    </tr>

    <tr align="center">
      <td colspan="2"><input type="submit"></td>
    </tr>
    </tbody>
  </table>
</form>
```

조금 보기 편하게 들여쓰기를 해주었다.

아이디 입력 부분을 잠깐 살펴보면 `input type="text" name="id" maxlength="5"`

maxlength 가 5로 설정되어있다. DB에서 5글자로 제한되어있나보다.

개발자도구로 6으로 설정해주고 뒤에 공백문자 하나를 추가하여 회원가입 후

로그인페이지로 다시 돌아가서 `admin` 계정으로 로그인 하였다.

끝!