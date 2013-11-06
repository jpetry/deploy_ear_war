#!/bin/bash

# source function library.
source /etc/rc.d/init.d/functions

# variables
SSO_DIR=$ORACLE_BASE/sso
#

# backup /opt/oracle/sso/config
mv $SSO_DIR/config $SSO_DIR/config.`date +\"%Y%m%d:%H:%M:%S\"`
mkdir $SSO_DIR/config

cd $CHROME_APPL

# Copy sso-login-config.xml and chrome-user-management.properties
cp -p $CHROME_APPL/sso-login-config.xml $CHROME_APPL/chrome-user-management.properties $SSO_DIR/config

sed -i "s/ChromeHostname/$CHROME_HOSTNAME/g" $SSO_DIR/config/sso-login-config.xml
sed -i "s/ChromeHostname/$CHROME_HOSTNAME/g" $SSO_DIR/config/chrome-user-management.properties
sed -i -e "s/ChromeHostname/$CHROME_HOSTNAME/g" -e "s/ChromePassword/$CHROME_PASSWORD/g" $CHROME_APPL/details.properties


# fix ownership
chown -R oracle:dba $SSO_DIR

#Set Domain Env
su - $ORACLE_OWNER -c "$OIAMDomain/bin/setDomainEnv.sh"

su - $ORACLE_OWNER -c "export CLASSPATH=/opt/oracle/product/fmw2/patch_wls1035/profiles/default/sys_manifest_classpath/weblogic_patch.jar:/opt/oracle/product/fmw2/patch_ocp360/profiles/default/sys_manifest_classpath/weblogic_patch.jar:/usr/java/jdk1.6.0_24/lib/tools.jar:/opt/oracle/product/fmw2/wls/server/lib/weblogic_sp.jar:/opt/oracle/product/fmw2/wls/server/lib/weblogic.jar:/opt/oracle/product/fmw2/modules/features/weblogic.server.modules_10.3.5.0.jar:/opt/oracle/product/fmw2/wls/server/lib/webservices.jar:/opt/oracle/product/fmw2/modules/org.apache.ant_1.7.1/lib/ant-all.jar:/opt/oracle/product/fmw2/modules/net.sf.antcontrib_1.1.0.0_1-0b2/lib/ant-contrib.jar::/opt/oracle/product/fmw2/oracle_common/modules/oracle.jrf_11.1.1/jrf-wlstman.jar:/opt/oracle/product/fmw2/oracle_common/common/wlst/lib/adfscripting.jar:/opt/oracle/product/fmw2/oracle_common/common/wlst/lib/adf-share-mbeans-wlst.jar:/opt/oracle/product/fmw2/oracle_common/common/wlst/lib/mdswlst.jar:/opt/oracle/product/fmw2/oracle_common/common/wlst/resources/auditwlst.jar:/opt/oracle/product/fmw2/oracle_common/common/wlst/resources/igfwlsthelp.jar:/opt/oracle/product/fmw2/oracle_common/common/wlst/resources/jps-wlst.jar:/opt/oracle/product/fmw2/oracle_common/common/wlst/resources/jrf-wlst.jar:/opt/oracle/product/fmw2/oracle_common/common/wlst/resources/oamap_help.jar:/opt/oracle/product/fmw2/oracle_common/common/wlst/resources/oamAuthnProvider.jar:/opt/oracle/product/fmw2/oracle_common/common/wlst/resources/ossoiap_help.jar:/opt/oracle/product/fmw2/oracle_common/common/wlst/resources/ossoiap.jar:/opt/oracle/product/fmw2/oracle_common/common/wlst/resources/ovdwlsthelp.jar:/opt/oracle/product/fmw2/oracle_common/common/wlst/resources/sslconfigwlst.jar:/opt/oracle/product/fmw2/oracle_common/common/wlst/resources/wsm-wlst.jar:/opt/oracle/product/fmw2/utils/config/10.3/config-launch.jar::/opt/oracle/product/fmw2/wls/common/derby/lib/derbynet.jar:/opt/oracle/product/fmw2/wls/common/derby/lib/derbyclient.jar:/opt/oracle/product/fmw2/wls/common/derby/lib/derbytools.jar::; java weblogic.WLST $CHROME_APPL/ssologin.py"
