from java.io import FileInputStream

propInputStream = FileInputStream("/opt/IrsamInstall/Chrome2.4/scripts/application/details.properties")
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

#edit()
#startEdit()
#cd('/')
#cmo.createJMSServer('ChromeJMSServer')
#
#cd('/Deployments/ChromeJMSServer')
#set('Targets',jarray.array([ObjectName('com.bea:Name=soa_server1,Type=Server')], ObjectName))
#
#activate()
#
##execfile('/opt/IrsamInstall/JMSScripts/CreateChromeModule_and_Queue.py')

#starting ssologin
print 'stopping and undeploying....'
stopApplication('ssologin')
edit()
startEdit()
undeploy('ssologin')
activate()

#deploy and start
print 'deploying....'
edit()
startEdit()
deploy('ssologin','/opt/IrsamInstall/Chrome2.4/scripts/application/ssologin.war',targets='chrome_sso_server1')
activate()
startApplication('ssologin')

#disconnect
print 'disconnection from admin server....'
disconnect()
exit()
