printf "커밋 메시지를 입력하세요 : "
read message
git pull
cd /workspace/blog-jekyll/
git add --all  /workspace/blog-jekyll/

git commit -m "$message"

git push
