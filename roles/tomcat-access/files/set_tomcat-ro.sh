#!/bin/bash

TOMCAT_HOME=$(ps -ef | egrep -i java | grep -P -o "catalina.base=.*? " | cut -d '=' -f2)
# Wyszukaj katalog domowy tomcata i przypisz uprawnienia do zapisu i odczytu - dla katalogów rwx, dla plików rw
find $TOMCAT_HOME -follow -type d -exec setfacl -m g:tomcat-ro:rx '{}' \;
find $TOMCAT_HOME -follow -type f -exec setfacl -m g:tomcat-ro:r '{}' \;
