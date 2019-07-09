#!/bin/bash

date=`date +%Y%m%d`
date7=`date -d'7 day ago' +%Y%m%d`
for i in {1..2};
do
    cd  /app/tomcat-7.0.88/gateway_$1/logs/

    cp catalina.out catalina.out.${date}
    echo "" > catalina.out
    rm -rf catalina.out.${date7}
done


#定时任务
*************************
0 0 * * * /bin/sh /usr/local/script/tomcat-log.sh
*******************************
