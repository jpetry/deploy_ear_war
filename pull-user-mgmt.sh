#!/bin/bash

set -e

echo "pulling down latest ear file from Nexus..."
wget "http://nexus.mtihq.com/nexus/service/local/artifact/maven/redirect?r=snapshots&g=com.mtihq&a=chrome-user-mgmt&p=ear&v=1.0-SNAPSHOT" -O /opt/IrsamInstall/download/chrome_user-mgmt.ear


echo "Latest ear file retrieved from Nexus..."