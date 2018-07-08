---
title: "[Webhacking.kr] 16번(100) 문제 풀이"
categories: 
  - Wargame
tags: 
  - web
  - webhackinag.kr
last_modified_at: 2018-07-08T23:53:00+09:00
---

`*`...?

소스를 봐야할 것 같다. 이번엔 스크립트부분만 살펴보자

```html

<script> 
document.body.innerHTML+="<font color=yellow id=aa style=position:relative;left:0;top:0>*</font>";

function mv(cd)
{
kk(star.style.posLeft-50,star.style.posTop-50);
if(cd==100) star.style.posLeft=star.style.posLeft+50;
if(cd==97) star.style.posLeft=star.style.posLeft-50;
if(cd==119) star.style.posTop=star.style.posTop-50;
if(cd==115) star.style.posTop=star.style.posTop+50;
if(cd==124) location.href=String.fromCharCode(cd);
}


function kk(x,y)
{
rndc=Math.floor(Math.random()*9000000);
document.body.innerHTML+="<font color=#"+rndc+" id=aa style=position:relative;left:"+x+";top:"+y+" onmouseover=this.innerHTML=''>*</font>";
}

</script>
```

`cd == 124` 일때 특정 링크로 이동하는 것 같다.

콘솔에 `String.fromCharCode(124)` 를 입력해보면 `|` 문자열이 출력된다.

문제 화면에서 `|` 를 입력하면 끝!