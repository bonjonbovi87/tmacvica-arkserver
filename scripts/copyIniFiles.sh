#!/bin/sh

git commit -a -m "local updates"
git pull
git push

cp /home/arkserver/tmacvica-arkserver/config/Game*.ini /home/arkserver/serverfiles/ShooterGame/Saved/Config/LinuxServer

#sed "s/serveradminpassword/$ARKSERVER_ADMIN_PASSWORD/g" -i /home/arkserver/serverfiles/ShooterGame/Saved/Config/LinuxServer/GameUserSettings.ini
#sed "s/serverpassword/$ARKSERVER_PASSWORD/g" -i /home/arkserver/serverfiles/ShooterGame/Saved/Config/LinuxServer/GameUserSettings.ini

sed "s/serveradminpassword/$ARKSERVER_ADMIN_PASSWORD/g" -i /home/arkserver/serverfiles/ShooterGame/Saved/Config/LinuxServer/GameUserSettings.ini
sed "s/serverpassword//g" -i /home/arkserver/serverfiles/ShooterGame/Saved/Config/LinuxServer/GameUserSettings.ini


cp /home/arkserver/tmacvica-arkserver/config/PlayersExclusiveJoinList.txt /home/arkserver/serverfiles/ShooterGame/Binaries/Linux/

cp /home/arkserver/tmacvica-arkserver/config/arkserver.cfg /home/arkserver/lgsm/config-lgsm/arkserver
