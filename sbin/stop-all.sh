#!/bin/bash

. "${RAMCLOUD_HOME}"/conf/ramcloud-env.sh

echo "# Terminating with all coordinators"
for ip in $(cat "${RAMCLOUD_COORDS}")
do
  script="${RAMCLOUD_HOME}/sbin/stop-deamon.sh coordinator"
  ssh $ip "${script}" 
done
echo "# Done"
echo " "

echo "# Terminating with all servers"
for ip in $(cat "${RAMCLOUD_SERVERS}")
do
  script="${RAMCLOUD_HOME}/sbin/stop-deamon.sh server"
  ssh $ip "${script}" 
done
echo "# Done"

exit 0
