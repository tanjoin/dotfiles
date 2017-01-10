#!/bin/bash

# 実行時に指定された引数の数、つまり変数 $# の値が 1 でなければエラー終了。
if [ $# -ne 1 ]; then
  echo ローカルリポジトリに"tanjoin"アカウントを設定します
  echo 引数に対象となる.gitのディレクトリパスを設定して下さい
  echo "指定された引数は$#個です。" 1>&2
  echo "実行するには1個の引数が必要です。" 1>&2
  exit 1
fi

if [ ! -d $1 ]; then
  echo "ディレクトリが存在しません" 1>&2
  exit 1
fi

if [ ! -f $1/.git/config ]; then
  echo ".git/configが存在しません" 1>&2
  exit 1
fi

# githubの設定をする
cd $1
git config user.name "tanjoin"
git config user.email "tanjoin@users.noreply.github.com"
exit 0
