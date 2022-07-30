STEAMAPPID=1690800
STEAMAPP=Satisfactory
STEAMAPPDIR="${HOMEDIR}/${STEAMAPP}-dedicated"

export LD_LIBRARY_PATH=${STEAMAPPDIR}/linux64:$LD_LIBRARY_PATH

bash ${STEAMCMDDIR}/steamcmd.sh +login anonymous +force_install_dir ${STEAMAPPDIR} +app_update ${STEAMAPPID} validate +quit
test -d ~/.config/Epic/FactoryGame/Saved || mkdir -p ~/.config/Epic/FactoryGame/Saved
test -d ${STEAMAPPDIR}/saves || mkdir ${STEAMAPPDIR}/saves
test -L ~/.config/Epic/FactoryGame/Saved/SaveGames || ln -s ${STEAMAPPDIR}/saves ~/.config/Epic/FactoryGame/Saved/SaveGames
${STEAMAPPDIR}/FactoryServer.sh
