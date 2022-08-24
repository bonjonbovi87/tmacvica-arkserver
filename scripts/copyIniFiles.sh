#!/bin/sh

git commit -a -m "local updates"
git pull
git push

cp /home/arkserver/tmacvica-arkserver/config/Game*.ini /home/arkserver/serverfiles/ShooterGame/Saved/Config/LinuxServer

