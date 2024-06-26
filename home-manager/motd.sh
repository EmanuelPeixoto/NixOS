#!/usr/bin/env bash

load=`cat /proc/loadavg     | awk '{print $2}'`
memory_usage=`free -m       | awk '/Mem/ { printf("%3.1f%%", $3/($2+1)*100) }'`
memory_total=`free -m       | awk '/Mem/ { printf("%3.1f", $2/1024) }'`
swap_usage=`free -m         | awk '/Swap/ { printf("%3.1f%%", $3/($2+1)*100) }'`
swap_total=`free -m         | awk '/Swap/ { printf("%3.1f", $2/1024) }'`

uptime=`cat /proc/uptime    | awk '{printf("%dd-%02dh-%02dm-%02ds\n",($1/60/60/24),($1/60/60%24),($1/60%60),($1%60))}'`
users=`users                | wc -w`



echo ""
printf "\x1B[32m=======================\x1B[37m\n"
printf "\x1B[32mSeja Bem Vindo Emanuel!\x1B[37m\n"
printf "\x1B[32m=======================\x1B[37m\n"
echo ""
printf "System load:\t\x1B[32m%s\x1B[37m\t\tMemory usage:\t\x1B[32m%s\x1B[37m of \x1B[32m%sG\x1B[37m\n" $load $memory_usage $memory_total
printf "Local users:\t\x1B[32m%s\x1B[37m\t\tSwap usage:\t\x1B[32m%s\x1B[37m of \x1B[32m%sG\x1B[37m\n" $users $swap_usage $swap_total
printf "Uptime:\t\x1B[32m%s\x1B[37m\t\t \n" $uptime
printf "To see data traffic type \x1B[32mvnstat\x1B[37m\n"
echo ""
timeout --signal=kill 2s df -h | grep -E "^(/dev/|Sist)"
echo ""
