#!/bin/bash

set -e

/opt/IrsamInstall/scripts/pull-user-mgmt.sh

echo "time to deploy it"

/opt/IrsamInstall/scripts/chrome-user-mgmt.sh

echo "all done. have a nice day"