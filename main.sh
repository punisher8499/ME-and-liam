#!/bin/bash
echo Smashed together by moreplit1 AKA SchoolTARMaster, server files by ayunami2000 or lax1dude or both.
trap 'echo Stopping Apache 2 ... && httpd -k stop -f ~/$REPL_SLUG/apache.conf && echo Apache 2 stopped && Stopping BungeeCord and Bukkit ... && pkill java && echo BungeeCord and Bukkit stopped' SIGTERM
echo Starting Apache 2 ...
httpd -k start -f ~/$REPL_SLUG/apache.conf
echo Apache 2 started
echo Starting BungeeCord and Bukkit ...
chmod +x ./java/bungee_command/run_unix.sh
chmod +x ./java/bukkit_command/run_unix.sh
cd ./java/bungee_command
sudo ./run_unix.sh > /dev/null 2>&1 &
cd ../bukkit_command && sudo ./run_unix.sh
