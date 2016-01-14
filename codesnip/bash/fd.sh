#!/bin/bash - 
#===============================================================================
#
#          FILE: fd.sh
# 
#         USAGE: ./fd.sh 
# 
#   DESCRIPTION: 通过文件描述符来打开文件，并将文件读取，写入，关闭
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2016年01月14日 13时09分12秒 CST
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

exec 3<in.txt
exec 4>out.txt

read -u 3 a b
read -u 3 -r line

while read -u 3 -r line
do
	echo $line
done

echo $line
echo $a >&4
echo $b >&4

exec 3<&-
exec 4<&-
