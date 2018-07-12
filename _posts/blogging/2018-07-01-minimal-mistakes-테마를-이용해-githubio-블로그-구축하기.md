---
title: "minimal mistakes 테마를 이용해 github.io 블로그 구축하기"
excerpt: "저장소를 fork하여 github pages 또는 travis-ci설정에 맞게 기본적인 환경설정을 하는 방법에 대하여"
categories: 
  - blogging
tags: 
  - jekyll
last_modified_at: 2018-07-01T13:00:00+09:00
toc: true
toc_sticky: true
---


## Intro

처음 만들어보는 페이지이다 보니 부족한 부분이 많습니다.  
언제든지 댓글 남겨주시면 수정하도록 하겠습니다!

{% capture intro %}

본 포스팅은 블로그 구축 후 작성하는 것으로,  minimal mistakes 테마를 Fork 하여 본인의 입맛에 맞게 수정하는 과정입니다.

또한 일부 내용은 [https://mmistakes.github.io/minimal-mistakes/docs/quick-start-guide/](https://mmistakes.github.io/minimal-mistakes/docs/quick-start-guide/) 의 내용을 참고하였습니다.

{% endcapture %}

<div class="notice">{{ intro | markdownify }}</div>

---

## 테마 Fork 후 불필요한 내용 삭제

저의 경우 [minimal mistakes 테마](https://github.com/mmistakes/minimal-mistakes) 를 사용했습니다.

![fork](/assets/img/fork.jpg)

위 저장소에 접속 하여 우측 상단의 Fork 버튼을 눌러 자신의 저장소로 복제 해 줍시다.

그 후 테마에 포함되어있는 불필요한 파일들을 삭제 해 줍니다.

목록은 아래와 같습니다.

- `.editorconfig`
- `.gitattributes`
- `.github`
- `/docs`
- `/test`
- `CHANGELOG.md`
- `minimal-mistakes-jekyll.gemspec`
- `README.md`
- `screenshot-layouts.png`
- `screenshot.png`

샘플페이지에 대한 데이터는 `docs/` 디렉터리에 저장되어 있으니 참고하실 분들은 삭제 하지 않으셔도 되지만 사이트에 샘플 포스트가 표시될 수 있습니다. 
{: .notice}

---

## _config.yml 변경
저장소 최상위 디렉토리에 존재하는 `_config.yml` 파일을 사용자의 취향에 맞게 설정 해 줍니다.

현재 사이트의 설정은 [\_config.yml 설정하기](https://blog.imreplay.xyz/blogging/config-yml) 에서 확인할 수 있습니다.

\_config.yml 에 대한 자세한 설명은 [configuration](https://mmistakes.github.io/minimal-mistakes/docs/configuration/) 에서 확인할 수 있습니다.

{% capture gp-user %}

github pages 를 이용하시는 분들은
https://github.com/imreplay/minimal-mistakes#github-pages-method 를 참고하여 

`gem "github-pages", group: :jekyll_plugins`
 추가 및  
 `remote_theme: "mmistakes/minimal-mistakes"`  설정, theme 부분 주석 처리 해주셔야 합니다!
 
 Settings 에서 github pages 브랜치 설정을 `master` 로 설정해주시면
 
 `계정명.github.io/저장소명` 으로 접근 가능합니다!
 
 예를 들면 [https://imreplay.github.io/test/](https://imreplay.github.io/test/) 처럼요!
 
{% endcapture %}

<div class="notice--warning">{{ gp-user | markdownify }}</div>

---

## Gemfile 설정
최상위 디렉토리에 위치한 Gemfile을 수정해 줍니다.

Gemfile에 대해서는 모르는 부분이 많아 샘플 Gemfile을 참고하시는것을 추천드립니다.

{% capture what-is-gem %}

**Gemfile?**
 - 다양한 Gem을 등록하는 파일 입니다.  
 - Gem은 루비에서 지원하는 패키지 시스템으로 필요한 프로그램을 관리할 수 있도록 도와줍니다.

{% endcapture %}

<div class="notice--info">{{ what-is-gem | markdownify }}</div>

아래는 예제 파일입니다.

minimal mistake 에서 샘플로 제공하는 `Gemfile` (추천)

```ruby
source "https://rubygems.org"

gem "github-pages", group: :jekyll_plugins

gem "tzinfo-data"
gem "wdm", "~> 0.1.0" if Gem.win_platform?

# If you have any plugins, put them here!
group :jekyll_plugins do
  gem "jekyll-paginate"
  gem "jekyll-sitemap"
  gem "jekyll-gist"
  gem "jekyll-feed"
  gem "jemoji"
  gem "jekyll-algolia"
end
```

현재 사이트에 적용되어있는 `Gemfile`

```ruby
source "https://rubygems.org"

gem "minimal-mistakes-jekyll"

gem "jekyll", "~> 3.6.2"
gem "github-pages", "~> 168"
gem "rake", "~> 12.3.0"

group :jekyll_plugins do
  gem "jekyll-feed"
  gem "jekyll-seo-tag"
  gem "jekyll-sitemap"
  gem "jekyll-paginate"
  gem "jekyll-algolia"
end
```

---

## navigation.yml 수정하기

최상위 디렉토리의 \_data/navigation.yml 을 수정합니다.

```yml
# main links
main:
  - title: "About" # 네비게이션 바에 표시 되는 이름
    url: "/about/" # 클릭시 이동할 URL
  - title: "Category"
    url: /categories/
  # - title: "Sample Collections"
  #   url: /collection-archive/
  # - title: "Sitemap"
  #   url: /sitemap
```

또한 이 파일을 통해 Sidebar를 커스터마이징 하는 기능또한 제공되고 있습니다.

해당 기능에 대한 설명은 [custom-sidebar-navigation-menu](https://mmistakes.github.io/minimal-mistakes/docs/layouts/#custom-sidebar-navigation-menu) 에서 확인가능합니다.

---

## \_pages 추가하기
기본 설정들은 어느정도 끝났으니 몇가지 페이지를 만들어봅시다.

먼저 최상위 폴더에 \_pages 라는 폴더를 만들어 준 후


minimal-mistake에서 [샘플](https://github.com/mmistakes/minimal-mistakes/tree/master/docs/_pages)로 제공되는 페이지 중 필요한 걸 몇가지 가져옵니다.

이번 포스팅에서 추가할 페이지는 

- 404 에러 페이지 (404.md)
- about 페이지 (about.md)
- 카테고리 페이지 (category-archive.md)
- 태그 페이지 (tag-archive.md)

정도만 가져오도록 하겠습니다.

```
/_pages
 ㄴ404.md
 ㄴabout.md
 ㄴcategory-archive.md
 ㄴtag-archive.md
```

이런 구조가 되겠군요. 

추가적으로 필요한 페이지가 있다면 가져오시면 되겠습니다.


`about.md` 페이지를 제외한 나머지 페이지들은 크게 수정할 부분이 없으니 그대로 사용하고, about 페이지는 개인의 취향에 맞게 수정하여 사용하시면 됩니다.
{: .notice}

그 후  `_config.yml` 파일에 \_pages에 대한 내용을 추가해줍니다. 


### _config.yml

```yml
defaults:
  # _posts
  - scope:
      path: ""
      type: posts
    values:
      layout: single
      author_profile: true
      read_time: true
      comments: true
      share: true
      related: true
  #>>>>>>>>>>>>>>>>>>> 여기서부터 추가 됨
  # _pages 부분입니다.
  - scope:
      path: "_pages"
      type: pages
    values:
      layout: single
      author_profile: true
  # >>>>>>>>>>>>>>>>>>>> 여기까지 추가 됨
```

## 포스팅 하기
\_posts 디렉토리를 최상위 폴더에 생성한 후 

`YYYY-MM-DD-제목.md` 형식으로 포스팅을 생성합니다.

`2018-01-01-hello-world.md` 와 같이 작성하시면 됩니다.

그 후, 헤더를 작성하고 글을 포스팅하면 됩니다.

```

---
title: "minimal mistakes 테마를 이용해 github.io 블로그 구축하기"
categories: 
  - blogging
last_modified_at: 2018-07-01T13:00:00+09:00
toc: true
---

```

위와같이 작성 할 수 있으며, 들어가는 항목은 title, categories, tags 등이 있습니다다.

https://mmistakes.github.io/minimal-mistakes/ 에서 여러가지 샘플들을 보며 참고하면 편할 듯 합니다.

아래는 몇가지 헤더부분에 들어가는 몇가지 예제입니다.

```yml
tags: # 태그 사용
    - tag1
    - tag2

categories: #카테고리
  - category a

author_profile: true / false #작성자 프로필 출력여부
read_time: false # read_time을 출력할지 여부 1min read 같은것!

toc: true #Table Of Contents 목차 보여줌
toc_label: "My Table of Contents" # toc 이름 정의
toc_icon: "cog" #font Awesome아이콘으로 toc 아이콘 설정
toc_sticky: true # 스크롤 내릴때 같이 내려가는 목차

gallery: #이미지 갤러리
  - url: /assets/images/unsplash-gallery-image-1.jpg
    image_path: /assets/images/unsplash-gallery-image-1-th.jpg
    alt: "placeholder image 1"
    title: "Image 1 title caption"
  - url: /assets/images/unsplash-gallery-image-2.jpg
    image_path: /assets/images/unsplash-gallery-image-2-th.jpg
    alt: "placeholder image 2"
    title: "Image 2 title caption"
#다음과 같이 본문에서 사용한다.
{% raw %}{% include gallery caption="This is a sample gallery with **Markdown support**." %}{% endraw %}

header:  # 헤더에 유튜브 비디오 삽입
  video:
    id: XsxDH4HcOWA
    provider: youtube


link: https://github.com # Direct Link 만들기
```


결과 페이지는 [https://imreplay.github.io/test/](https://imreplay.github.io/test/) 처럼 나오네요!

다음 포스팅은 travis-ci를 통해 push를 하면 자동으로 Build되어 gh-pages 브랜치로 결과 파일을 push 해주는 방법에 대하여 포스팅 하도록 하겠습니다.

혹시 안되거나 에러나는 부분들, 설명이 부족한 부분은 댓글로 남겨주세요!
