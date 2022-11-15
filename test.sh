#!/usr/bin/env zsh

set -euo pipefail # pipefail : 스크립트의 명령을 실행하다가 중간에 실패하는 경우, 더 이상 진행하지 않도록
export COLOR_GREEN='\e[0;32m'
export COLOR_NC='\e[0m' # No Color
# 만약 mypy 검사에서 잘못된 게 나온다면, 잘못을 수정하신 후에 다시 ./test.sh 스크립트를 실행

echo "Run black"
poetry run black .

echo "Run isort"
poetry run isort .

echo "Run mypy"
poetry run mypy .

echo "Run tests"
python manage.py test

echo "${COLOR_GREEN}Success!${COLOR_NC}"
# 초록색 글로 끝나야 정적검사가 완료된 것임.