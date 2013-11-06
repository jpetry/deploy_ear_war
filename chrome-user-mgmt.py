from java.io import FileInputStream

propInputStream = FileInputStream("/opt/IrsamInstall/scripts/details.properties")
configProps = Properties()
configProps.load(propInputStream)

domainName=configProps.get("domain.name")
adminURL=configProps.get("admin.url")
adminUserName=configProps.get("admin.userName")
adminPassword=configProps.get("admin.password")

#dsName=configProps.get("datasource.name")
#dsFileName=configProps.get("datasource.filename")
#dsDatabaseName=configProps.get("datasource.database.name")
#datasourceTarget=configProps.get("datasource.target")
#dsJNDIName=configProps.get("datasource.jndiname")
#dsDriverName=configProps.get("datasource.driver.class")
#dsURL=configProps.get("datasource.url")
#dsUserName=configProps.get("datasource.username")
#dsPassword=configProps.get("datasource.password")
#dsTestQuery=configProps.get("datasource.test.query")
#managedserver=configProps.get("managedserver")

connect(adminUserName, adminPassword, adminURL)
#connect('weblogic','Weblogic!','t3://localhost:001')


#starting chrome-user-mgmt.ear 
#print 'stopping and undeploying....'
#stopApplication('chrome_user-mgmt')
#edit()
#startEdit()
#undeploy('chrome_user-mgmt')
#activate()

#deploy and start
print 'deploying chrome-user-mgmt.ear....'
edit()
startEdit()
deploy('chrome_user-mgmt','/opt/IrsamInstall/download/chrome_user-mgmt.ear',targets='chrome_sso_server1')
activate()
startApplication('chrome_user-mgmt')

#disconnect
print 'disconnection from admin server....'
disconnect()
exit()
