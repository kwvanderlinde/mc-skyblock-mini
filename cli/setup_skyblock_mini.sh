#!/bin/sh

set -e

COLOR_INFO="$(tput bold)$(tput setaf 5)"
COLOR_PROMPT="$(tput bold)$(tput setaf 3)"
COLOR_RESPONSE="$(tput bold)$(tput setaf 2)"
COLOR_ERROR="$(tput bold)$(tput setaf 1)"
COLOR_NORMAL="$(tput sgr0)"

PROTOSKY_VERSION='1.1.8'
FABRIC_INSTALLER_VERSION='0.11.0'
MINECRAFT_VERSION='1.19.2'

read -p "${COLOR_PROMPT}Server directory: ${COLOR_NORMAL}" SERVER_DIRECTORY
mkdir -p "${SERVER_DIRECTORY}"
SERVER_DIRECTORY=$(realpath "${SERVER_DIRECTORY}")

if [ "$(ls -A ${SERVER_DIRECTORY})" ]
then
    >&2 printf "${COLOR_ERROR}Server directory '%s' is not empty. Aborting...${COLOR_NORMAL}\n" "${SERVER_DIRECTORY}"
    exit 1
fi

printf "${COLOR_RESPONSE}Okay, I will make a Skyblock Mini server in this directory: %s${COLOR_NORMAL}\n" "${SERVER_DIRECTORY}"

MODS_DIRECTORY="${SERVER_DIRECTORY}/mods/"
DATAPACKS_DIRECTORY="${SERVER_DIRECTORY}/world/datapacks/"

printf "${COLOR_INFO}Downloading dependencies...${COLOR_NORMAL}\n"
mkdir -p "${MODS_DIRECTORY}"
mkdir -p "${DATAPACKS_DIRECTORY}"
wget --quiet --show-progress "https://cdn.modrinth.com/data/5EkUrOuD/versions/${PROTOSKY_VERSION}/protosky-${PROTOSKY_VERSION}.jar" -P "${MODS_DIRECTORY}"
wget --quiet --show-progress "https://github.com/kwvanderlinde/mc-skyblock-mini/releases/latest/download/SkyblockMini.zip" -P "${DATAPACKS_DIRECTORY}"
wget --quiet --show-progress "https://maven.fabricmc.net/net/fabricmc/fabric-installer/${FABRIC_INSTALLER_VERSION}/fabric-installer-${FABRIC_INSTALLER_VERSION}.jar" -P "${SERVER_DIRECTORY}"
printf "${COLOR_INFO}Done downloading dependencies.${COLOR_NORMAL}\n"

printf "${COLOR_INFO}Running fabric installer...${COLOR_NORMAL}\n"
java -jar "${SERVER_DIRECTORY}/fabric-installer-${FABRIC_INSTALLER_VERSION}.jar" server -dir "${SERVER_DIRECTORY}" -mcversion "${MINECRAFT_VERSION}" -downloadMinecraft
rm "${SERVER_DIRECTORY}/fabric-installer-${FABRIC_INSTALLER_VERSION}.jar"
printf "${COLOR_INFO}Done running fabric installer.${COLOR_NORMAL}\n"

echo '#!/bin/sh' > "${SERVER_DIRECTORY}/start.sh"
echo 'java -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:MaxTenuringThreshold=1 -Dfml.readTimeout=120 -Dfile.encoding=UTF-8 -jar fabric-server-launch.jar nogui' >> "${SERVER_DIRECTORY}/start.sh"
chmod +x "${SERVER_DIRECTORY}/start.sh"

printf "${COLOR_INFO}Starting server for the first time...${COLOR_NORMAL}\n"
cd "${SERVER_DIRECTORY}"
./start.sh
printf "${COLOR_INFO}Done.${COLOR_NORMAL}\n"
# User will now be prompted to accept EULA, but also server.properties is generated which is cool.

printf "${COLOR_INFO}Once you accept the EULA, you can start the server by running: ./start.sh${COLOR_NORMAL}\n"
