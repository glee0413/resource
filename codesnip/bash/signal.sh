#!/bin/bash - 
#===============================================================================
#
#          FILE: signal.sh
# 
#         USAGE: ./signal.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2016年01月14日 13时42分22秒 CST
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
die(){
	  echo "..."
}

# set trap and call die()
trap 'die' 1 2 3 15
# 取消信号
trap - 1 2 3 15

