#!/bin/bash

if [ "$NEWINSTANCE" = true ];
then
    echo "JasperReports Server is beeing installed... "
	./tmp/jasper/jasperreports-server-cp-6.4.0-bin/buildomatic/js-install-ce.sh
	
fi

echo "JasperReports Server is starting... "
./usr/local/tomcat/bin/startup.sh