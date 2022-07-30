#!/bin/sh

set -e

PROTOSKY_VERSION='1.1.8'
FABRIC_INSTALLER_VERSION='0.11.0'
MINECRAFT_VERSION='1.19.1'

read -p 'Server directory: ' SERVER_DIRECTORY
mkdir -p "${SERVER_DIRECTORY}"
SERVER_DIRECTORY=$(realpath "${SERVER_DIRECTORY}")
echo "Okay, I will make a Skyblock Mini server in this directory: ${SERVER_DIRECTORY}"

if [ "$(ls -A ${SERVER_DIRECTORY})" ]
then
    >&2 echo "Server directory is not empty. Aborting..."
    exit 1
fi

MODS_DIRECTORY="${SERVER_DIRECTORY}/mods/"
DATAPACKS_DIRECTORY="${SERVER_DIRECTORY}/world/datapacks/"

mkdir -p "${MODS_DIRECTORY}"
mkdir -p "${DATAPACKS_DIRECTORY}"

wget "https://cdn.modrinth.com/data/5EkUrOuD/versions/${PROTOSKY_VERSION}/protosky-${PROTOSKY_VERSION}.jar" -P "${MODS_DIRECTORY}"
wget "https://github.com/kwvanderlinde/mc-skyblock-mini/releases/latest/download/SkyblockMini.zip" -P "${DATAPACKS_DIRECTORY}"

wget "https://maven.fabricmc.net/net/fabricmc/fabric-installer/${FABRIC_INSTALLER_VERSION}/fabric-installer-${FABRIC_INSTALLER_VERSION}.jar" -P "${SERVER_DIRECTORY}"
java -jar "${SERVER_DIRECTORY}/fabric-installer-${FABRIC_INSTALLER_VERSION}.jar" server -dir "${SERVER_DIRECTORY}" -mcversion "${MINECRAFT_VERSION}" -downloadMinecraft
rm "${SERVER_DIRECTORY}/fabric-installer-${FABRIC_INSTALLER_VERSION}.jar"

echo '#!/bin/sh' > "${SERVER_DIRECTORY}/start.sh"
echo 'java -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:MaxTenuringThreshold=1 -Dfml.readTimeout=120 -Dfile.encoding=UTF-8 -jar fabric-server-launch.jar nogui' >> "${SERVER_DIRECTORY}/start.sh"
chmod +x "${SERVER_DIRECTORY}/start.sh"

cd "${SERVER_DIRECTORY}"
./start.sh
# User will now be prompted to accept EULA, but also server.properties is generated which is cool.

echo 'Once you accept the EULA, you can start the server by running: ./start.sh'
