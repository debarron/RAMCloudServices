#!/bin/bash

if [ "$#" -ne 4 ]; then
  echo "USAGE:"
  echo "$0 MEMORY_MB BACKUP_FILE SEGMENT_FRAMES R"
  exit 1
fi

MEMORY="$1"
BACKUP_FILE="$2"
SEGMENT_FRAMES="$3"
R="$4"

. $RAMCLOUD_HOME/conf/ramcloud-env.sh

for ip in $(cat "$RAMCLOUD_SERVERS")
do
  script="${GRAPH_DB_HOME}/RAMCloudServices/start-deamon.sh ${RAMCLOUD_HOME}/obj.master/server -L $RAMCLOUD_PROTOCOL:host=${ip},port=${RAMCLOUD_SERVER_PORT} -x ${RAMCLOUD_ZOOKEEPER_LEAADER} --totalMasterMemory ${MEMORY} -f ${BACKUP_FILE} --segmentFrames ${SEGMENT_FRAMES} -r ${R}"
  
  ssh $ip "${script}"
done

exit 0
