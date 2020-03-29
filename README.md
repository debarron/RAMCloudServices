This repository has been integrates to <a href="github.com/debarron/RAMCloud">debarron/RAMCloud</a>

# RAMCloudServices

This repositiory contains a set of scripts to manage a <a href="https://github.com/PlatformLab/RAMCloud">RAMCloud repository</a>.
The development was based on Apache Spark project's structure, where they have
the *sbin* and *conf* directories.

## Configuration directory *conf/*
It contains three files:
* coordinators, a text file listing the IPs of all the coordinators to be lauched
* servers, a text file listing the IPs of all the servers to be lauched
* ramcloud-env.sh.template, a shell-script template file with enviroment variables

## Script directory *sbin/*
It contains a set of scripts to manage a RAMCloud cluster:
* start-all.sh, Starts all the servers and coodinators listed in conf's text files
* start-all-coordinators.sh, Starts all the coordinators listed in conf/coordinators
* start-all-servers.sh, Starts all the servers listed in conf/servers
* start-daemon.sh, Execute a process using nohup
* start-zookeeper.sh, Starts zookeeper in both conf/coorinators and conf/servers
* stop-zookeeper.sh, Stop zookeeper in all nodes in conf/coordinators and conf/servers
* stop-daemon.sh, Stop a process based on PID
* stop-all.sh, Stop all coordinators and servers

## How to use is
User has to do the following before using the scripts:
1. Define `RAMCLOUD_HOME`, an enviroment variable pointing to RAMCloud's source dir
2. List all coordinators' and servers' IPs in conf/coordinators and conf/servers
3. Copy conf/ramcloud-env.sh.template to conf/ramcloud-env.sh
4. Fill the blanks in conf/ramcloud-env.sh with your own cluster specific params
5. Copy conf and sbin and paste at `RAMCLOUD_HOME` for every node in the RAMCloud cluster.

 
