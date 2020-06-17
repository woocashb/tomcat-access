#!/bin/bash

TOMCAT_HOME=$(ps -ef | egrep -i java | grep -P -o "catalina.base=.*? " | cut -d '=' -f2)
# Wyszukaj katalog domowy tomcata i przypisz uprawnienia do zapisu i odczytu - dla katalogów rwx, dla plików rw
if [[ -z $TOMCAT_HOME ]];then
   echo "Nie udało się ustalić katalogu domowego Tomcata - przerywam działanie, czy usługa jest włączona?"
   exit 1
fi
find $TOMCAT_HOME -follow -type d -exec setfacl -m g:tomcat-rw:rwx '{}' \;
find $TOMCAT_HOME -follow -type f -exec setfacl -m g:tomcat-rw:rw '{}' \;
