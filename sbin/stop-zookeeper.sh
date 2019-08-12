#!/bin/bash

. "${GRAPH_DB_HOME}"/RAMCloudServices/ramcloud-env.sh

echo "# Terminating with all coordinators"
for ip in $(cat "${RAMCLOUD_COORDS}")
do
  script="${GRAPH_DB_HOME}/zookeeper/bin/zkServer.sh stop"
  ssh $ip "${script}" > /dev/null
done
echo "# Done"
echo " "

echo "# Terminating with all servers"
for ip in $(cat "${RAMCLOUD_SERVERS}")
do
  script="${GRAPH_DB_HOME}/zookeeper/bin/zkServer.sh stop"
  ssh $ip "${script}"  > /dev/null
done
echo "# Done"

exit 0
