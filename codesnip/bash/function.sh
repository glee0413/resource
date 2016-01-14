#!/bin/bash - 
#===============================================================================
#
#          FILE: function.sh
# 
#         USAGE: ./function.sh 
# 
#   DESCRIPTION: 后台执行函数
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2016年01月14日 13时55分13秒 CST
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
#!/bin/bash
# progressdots.sh - Display progress while making backup
# Based on idea presnted by nixCraft forum user rockdalinux
# Show progress dots
progress(){
	echo -n "$0: Please wait..."
	while true
	do
		echo -n "."
		sleep 5
	done
}

dobackup(){
	    # put backup commands here
		sleep 20
}

# Start it in the background
progress &

# 保存后台执行的函数pid
# 需要使用此表来杀死
MYSELF=$!

# Start backup
# Transfer control to dobackup()
dobackup

# Kill progress
kill $MYSELF >/dev/null 2>&1

echo -n "...done."
echo

