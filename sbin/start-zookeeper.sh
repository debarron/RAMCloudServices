#!/bin/bash

RCSERVICES_HOME="/users/dl544/graph-db-project/RAMCloudServices/"
ZK_HOME="/users/dl544/graph-db-project/zookeeper/"

for ip in $(cat "$RCSERVICES_HOME/coordinators" "$RCSERVICES_HOME/servers")
do
  ssh $ip "$ZK_HOME/bin/zkServer.sh start"
done

exit 0
