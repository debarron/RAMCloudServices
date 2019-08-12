#!/bin/bash
. "${RAMCLOUD_HOME}/conf/ramcloud-env.sh"

for ip in $(cat "$RAMCLOUD_COORDS")
do
  script="${RAMCLOUD_HOME}/sbin/start-deamon.sh ${RAMCLOUD_HOME}/obj.master/coordinator -C ${RAMCLOUD_PROTOCOL}:host=${ip},port=${RAMCLOUD_COORD_PORT} -x ${RAMCLOUD_ZOOKEEPER_LEADER}"

  ssh $ip "${script}" 
done

exit 0
