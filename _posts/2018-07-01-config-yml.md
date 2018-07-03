---
title:  _config.yml 설정하기
excerpt: "minimal-mistakes 테마에서의 _config.yml 설정에 대하여"
search: true
categories: 
  - blogging
tags: 
  - jekyll
last_modified_at: 2018-07-01T13:05:00+09:00
---


minimal-mistakes 테마의 기본 _config.yml을 수정한 내용입니다

개인적인 의견으로 작성 시 기본 설정 파일을 가지고 내용을 추가해 나가는 것이 편합니다!


### _config.yml

```yml
# Welcome to Jekyll!
#
# This config file is meant for settings that affect your entire site, values
# which you are expected to set up once and rarely need to edit after that.
# For technical reasons, this file is *NOT* reloaded automatically when you use
# `jekyll serve`. If you change this file, please restart the server process.

# Theme Settings
#
# Review documentation to determine if you should use `theme` or `remote_theme`
# https://mmistakes.github.io/minimal-mistakes/docs/quick-start-guide/#installing-the-theme


# 테마 설정에 대한 부분입니다. 기본 설정을 유지하였습니다.
theme                  : "minimal-mistakes-jekyll"
#remote_theme           : "mmistakes/minimal-mistakes"

# 스킨을 설정하는 부분입니다. 
minimal_mistakes_skin    : "dark" # "air", "aqua", "contrast", "dark", "dirt", "neon", "mint", "plum", "sunrise"


# Site Settings
locale                   : "ko-KR" # 사이트의 언어 설정을 할 수있습니다.
# 표시되는 언어의 내용은 _data/ui-text.yml 에서 수정이 가능합니다.

title                    : "Imreplay blog" # 블로그 제목
title_separator          : "-" # 글 제목 - 블로그 제목  과 같이 사이트를 표시해줍니다.
name                     : "Imreplay" # 사이트 소유자의 이름을 사용합니다.(Used to assign a site author.)
description              : "Imreplay's personal website." # 사이트에 대한 간단한 설명입니다.
url                      : "https://blog.imreplay.xyz" # the base hostname & protocol for your site e.g. "https://mmistakes.github.io"
# 사이트의 주소를 입력합니다.

baseurl                  : # the subpath of your site, e.g. "/blog"
# 사이트의 baseurl을 설정해 줍니다.

repository               : "imreplay/blog" # GitHub username/repo-name e.g. "mmistakes/minimal-mistakes"
teaser                   : # path of fallback teaser image, e.g. "/assets/images/500x300.png"
# breadcrumbs            : false # true, false (default)
words_per_minute         : 200 #read time을 계산하기 위한 분당 읽는 글자수 입니다. 
comments: # 댓글 설정에 대한부분입니다. 기본적으로 false 로 되어있습니다.
  provider               : "disqus" # false (default), "disqus", "discourse", "facebook", "google-plus", "staticman", "staticman_v2" "custom"
  disqus:   #개인적으로 disqus 댓글 모듈을 사용하였습니다.
    shortname            : imreplay-blog # https://help.disqus.com/customer/portal/articles/466208-what-s-a-shortname-
  discourse:
    server               : # https://meta.discourse.org/t/embedding-discourse-comments-via-javascript/31963 , e.g.: meta.discourse.org
  facebook:
    # https://developers.facebook.com/docs/plugins/comments
    appid                :
    num_posts            : # 5 (default)
    colorscheme          : # "light" (default), "dark"
staticman:
  allowedFields          : # ['name', 'email', 'url', 'message']
  branch                 : # "master"
  commitMessage          : # "New comment."
  filename               : # comment-{@timestamp}
  format                 : # "yml"
  moderation             : # true
  path                   : # "/_data/comments/{options.slug}" (default)
  requiredFields         : # ['name', 'email', 'message']
  transforms:
    email                : # "md5"
  generatedFields:
    date:
      type               : # "date"
      options:
        format           : # "iso8601" (default), "timestamp-seconds", "timestamp-milliseconds"
reCaptcha:
  siteKey                :
  secret                 :
atom_feed:
  path                   : # blank (default) uses feed.xml

#사이트내 검색 설정에 대한 부분입니다.
search                   : true # true, false (default)
search_full_content      : true # true, false (default)
# 저의 경우 algolia 를 사용하고 있으며 추가설정이 필요합니다.
search_provider          : algolia # lunr (default), algolia, google
algolia:
  application_id         : 237ZENFYNY # YOUR_APPLICATION_ID
  index_name             : blog # YOUR_INDEX_NAME
  search_only_api_key    : 5cfd50ded1da95d695708070be40e3b9 # YOUR_SEARCH_ONLY_API_KEY
  powered_by             : # true (default), false
google:
  search_engine_id       : # YOUR_SEARCH_ENGINE_ID
  instant_search         : # false (default), true

# SEO Related 웹마스터 도구 사용을 도와주는 부분입니다.
google_site_verification :
bing_site_verification   :
yandex_site_verification :
naver_site_verification  :

# Social Sharing
twitter:
  username               :
facebook:
  username               : 
  app_id                 :
  publisher              :
og_image                 : # Open Graph/Twitter default site image
# For specifying social profiles
# - https://developers.google.com/structured-data/customize/social-profiles
social:
  type                   : # Person or Organization (defaults to Person)
  name                   : # If the user or organization name differs from the site's name
  links: # An array of links to social media profiles

#구글 애널리틱스에 대한 설정입니다.
# Analytics
analytics:
  provider               : "google-gtag" # false (default), "google", "google-universal", "custom"
  google:
    tracking_id          : "UA-120523980-2"
    anonymize_ip         : # true, false (default)

# 사이트 소유자에 대한 정보를 작성합니다.
# Site Author
author:
  name             : "Imreplay"
  avatar           : # path of avatar image, e.g. "/assets/images/bio-photo.jpg"
  bio              : "천천히 굴러가는 개인 공부 블로그"
  location         : "Republic of Korea"
  email            : "imreplay@imreplay.xyz"
  uri              : "https://blog.imreplay.xyz"
  home             : # null (default), "absolute or relative url to link to author home"
  bitbucket        :
  codepen          :
  dribbble         :
  flickr           :
  facebook         : "imreplay08"
  foursquare       :
  github           : "imreplay"
  gitlab           :
  google_plus      :
  keybase          :
  instagram        :
  lastfm           :
  linkedin         : # "john-doe-12345678" (the last part of your profile url, e.g. https://www.linkedin.com/in/john-doe-12345678)
  pinterest        :
  soundcloud       :
  stackoverflow    : # "123456/username" (the last part of your profile url, e.g. https://stackoverflow.com/users/123456/username)
  steam            : # "steamId" (the last part of your profile url, e.g. https://steamcommunity.com/id/steamId/)
  tumblr           :
  twitter          :
  vine             :
  weibo            :
  xing             :
  youtube          : # "https://youtube.com/c/MichaelRoseDesign"


# Reading Files
include:
  - .htaccess
  - _pages
exclude:
  - "*.sublime-project"
  - "*.sublime-workspace"
  - vendor
  - .asset-cache
  - .bundle
  - .jekyll-assets-cache
  - .sass-cache
  - assets/js/plugins
  - assets/js/_main.js
  - assets/js/vendor
  - Capfile
  - CHANGELOG
  - config
  - Gemfile
  - Gruntfile.js
  - gulpfile.js
  - LICENSE
  - log
  - node_modules
  - package.json
  - Rakefile
  - README
  - tmp
keep_files:
  - .git
  - .svn
encoding: "utf-8"
markdown_ext: "markdown,mkdown,mkdn,mkd,md"


# Conversion
markdown: kramdown
highlighter: rouge
lsi: false
excerpt_separator: "\n\n"
incremental: false


# Markdown Processing
kramdown:
  input: GFM
  hard_wrap: false
  auto_ids: true
  footnote_nr: 1
  entity_output: as_char
  toc_levels: 1..6
  smart_quotes: lsquo,rsquo,ldquo,rdquo
  enable_coderay: false


# Sass/SCSS
sass:
  sass_dir: _sass
  style: compressed # http://sass-lang.com/documentation/file.SASS_REFERENCE.html#output_style


# Outputting
permalink: /:categories/:title/
paginate: 5 # amount of posts to show
paginate_path: /page:num/
timezone: "Asia/Seoul" # https://en.wikipedia.org/wiki/List_of_tz_database_time_zones

# 플러그인을 정의하는 부분입니다.
# Plugins (previously gems:)
plugins:
  - jekyll-algolia
  - jekyll-paginate
  - jekyll-sitemap
  - jekyll-gist
  - jekyll-feed
  - jemoji

# mimic GitHub Pages with --safe
whitelist:
  - jekyll-paginate
  - jekyll-sitemap
  - jekyll-gist
  - jekyll-feed
  - jemoji


# Archives
#  Type
#  - GitHub Pages compatible archive pages built with Liquid ~> type: liquid (default)
#  - Jekyll Archives plugin archive pages ~> type: jekyll-archives
#  Path (examples)
#  - Archive page should exist at path when using Liquid method or you can
#    expect broken links (especially with breadcrumbs enabled)
#  - <base_path>/tags/my-awesome-tag/index.html ~> path: /tags/
#  - <base_path/categories/my-awesome-category/index.html ~> path: /categories/
#  - <base_path/my-awesome-category/index.html ~> path: /
category_archive:
  type: liquid
  path: /categories/
tag_archive:
  type: liquid
  path: /tags/
# https://github.com/jekyll/jekyll-archives
# jekyll-archives:
#   enabled:
#     - categories
#     - tags
#   layouts:
#     category: archive-taxonomy
#     tag: archive-taxonomy
#   permalinks:
#     category: /categories/:name/
#     tag: /tags/:name/


# HTML Compression
# - http://jch.penibelst.de/
compress_html:
  clippings: all
  ignore:
    envs: development


# Front Matter 설정입니다.
# 페이지 본문에 적용되는 기본 설정들을 정의합니다.
# path 값으로 경로를 설정해 줍니다.
# Defaults
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

  # 테마에 포함되어 있던 Docs 폴더의 _config.yml을 참고하여 _pages 폴더를 만들고 그 폴더에 대한 출력 방법을 정의 했습니다.
  # _pages
  - scope:
      path: "_pages"
      type: pages
    values:
      layout: single
      author_profile: true

# Travis-ci 를 사용하기 위해 추가한 부분입니다.
# Jasper2 테마의 Travis-ci 설정부분을 사용합니다. 
#
#build option
# Settings for builing master branch with travis-ci
# with jekyll-travis

# Settings for deploy rake task
# Username and repo of Github repo, e.g.
# https://github.com/USERNAME/REPO.git
# username defaults to ENV['GIT_NAME'] used by Travis
# repo defaults to USERNAME.github.io
# Branch defaults to "source" for USERNAME.github.io
# or "master" otherwise
safe: False
lsi: False
username: imreplay # Github Username
repo: blog # Github repo name
branch: master # 작업 브랜치를 설정
relative_source: ../blog/ # 저는 repo 이름으로 설정했습니다.
destination: ../posts # 빌드시 작업파일이 저장될 경로
production_url:  https://blog.imreplay.xyz # 사이트 URL
source_url:  https://github.com/imreplay/blog/ # Github 저장소 URL
```
