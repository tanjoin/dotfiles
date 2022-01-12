#!/bin/bash

# 実行時に指定された引数の数、つまり変数 $# の値が 1 でなければエラー終了。
if [ $# -ne 1 ]; then
  echo "tanjoin"アカウントのSSHで Git Clone をします
  echo 引数に対象となるSSHパスを設定して下さい
  echo "指定された引数は$#個です。" 1>&2
  echo "実行するには1個の引数が必要です。" 1>&2
  exit 1
fi

if [[ ! $1 =~ ^git@github\.com:tanjoin/(.*)\.git$ ]]; then
  echo "git@github.com:tanjoin/xxx.git 形式のパスを準備してください"
  exit 1
fi

NEW_PATH=`echo $1 | sed s/@github.com:/@tanjoin:/`
NEW_DIR=`echo $1 | sed s/git@github\.com:.*\\\///`
NEW_DIR=`echo $NEW_DIR | sed s/.git//`

if [ -d $NEW_DIR ]; then
  echo "既にディレクトリが存在します" 1>&2
else
  git clone $NEW_PATH
fi

./private_project.sh $NEW_DIR