#!/bin/bash

# source function library.
source /etc/rc.d/init.d/functions

# variables
ORACLE_OWNER=oracle
ORACLE_BASE=/opt/oracle
ORACLE_SID=irsamid
ORACLE_UNQNAME=$ORACLE_SID
ORACLE_HOME=$ORACLE_BASE/product/dbs
TNS_ADMIN=$ORACLE_HOME/network/admin
#
FMW2=$ORACLE_BASE/product/fmw2
irsam=/opt/IrsamInstall
scripts=$irsam/scripts/
#
export CLASSPATH=/opt/oracle/product/fmw2/patch_wls1035/profiles/default/sys_manifest_classpath/weblogic_patch.jar:/opt/oracle/product/fmw2/patch_ocp360/profiles/default/sys_manifest_classpath/weblogic_patch.jar:/usr/java/jdk1.6.0_24/lib/tools.jar:/opt/oracle/product/fmw2/wls/server/lib/weblogic_sp.jar:/opt/oracle/product/fmw2/wls/server/lib/weblogic.jar:/opt/oracle/product/fmw2/modules/features/weblogic.server.modules_10.3.5.0.jar:/opt/oracle/product/fmw2/wls/server/lib/webservices.jar:/opt/oracle/product/fmw2/modules/org.apache.ant_1.7.1/lib/ant-all.jar:/opt/oracle/product/fmw2/modules/net.sf.antcontrib_1.1.0.0_1-0b2/lib/ant-contrib.jar::/opt/oracle/product/fmw2/oracle_common/modules/oracle.jrf_11.1.1/jrf-wlstman.jar:/opt/oracle/product/fmw2/oracle_common/common/wlst/lib/adfscripting.jar:/opt/oracle/product/fmw2/oracle_common/common/wlst/lib/adf-share-mbeans-wlst.jar:/opt/oracle/product/fmw2/oracle_common/common/wlst/lib/mdswlst.jar:/opt/oracle/product/fmw2/oracle_common/common/wlst/resources/auditwlst.jar:/opt/oracle/product/fmw2/oracle_common/common/wlst/resources/igfwlsthelp.jar:/opt/oracle/product/fmw2/oracle_common/common/wlst/resources/jps-wlst.jar:/opt/oracle/product/fmw2/oracle_common/common/wlst/resources/jrf-wlst.jar:/opt/oracle/product/fmw2/oracle_common/common/wlst/resources/oamap_help.jar:/opt/oracle/product/fmw2/oracle_common/common/wlst/resources/oamAuthnProvider.jar:/opt/oracle/product/fmw2/oracle_common/common/wlst/resources/ossoiap_help.jar:/opt/oracle/product/fmw2/oracle_common/common/wlst/resources/ossoiap.jar:/opt/oracle/product/fmw2/oracle_common/common/wlst/resources/ovdwlsthelp.jar:/opt/oracle/product/fmw2/oracle_common/common/wlst/resources/sslconfigwlst.jar:/opt/oracle/product/fmw2/oracle_common/common/wlst/resources/wsm-wlst.jar:/opt/oracle/product/fmw2/utils/config/10.3/config-launch.jar::/opt/oracle/product/fmw2/wls/common/derby/lib/derbynet.jar:/opt/oracle/product/fmw2/wls/common/derby/lib/derbyclient.jar:/opt/oracle/product/fmw2/wls/common/derby/lib/derbytools.jar::

#Set Domain Env
/opt/oracle/product/fmw2/user_projects/domains/OIAMDomain/bin/setDomainEnv.sh


java weblogic.WLST $scripts/chrome-user-mgmt.py
