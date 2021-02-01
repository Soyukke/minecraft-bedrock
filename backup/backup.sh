#!/bin/bash
container=bedrock

# バックアップするフォルダ
dnbase=`dirname $0`

dayname=`date +%Y-%m-%d-%I-%M`
dn=$dnbase/temp
# フォルダ作成
mkdir -p -- $dn
# バックアップ
docker cp $container:/data $dn
# 固める
tar -czf $dnbase/$dayname.tar.gz $dn/data
# 一時ファイル削除
rm -rf $dn