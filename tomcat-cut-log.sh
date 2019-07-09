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

#第二种脚本，多个tomcat不同，且目录没有规律
#!/bin/bash
date=`date +%Y%m%d`
date7=`date -d'7 day ago' +%Y%m%d`


dir1=/app/tomcat-7.0.88/getopenid/logs/
dir2=/app/tomcat-7.0.88/myphone/logs/
dir3=/app/tomcat-7.0.88/poundrecordquery/logs/
dir4=/app/tomcat-7.0.88/registerpush/logs/
dir5=/app/tomcat-7.0.88/sitenavigation/logs/
dir6=/app/tomcat-7.0.88/tasknotify/logs/
dir7=/app/tomcat-7.0.88/taskquery/logs/
dir8=/app/tomcat-7.0.88/trackupload/logs/

for i in {1..8};
do
    eval value=\${dir${i}}
    cd $value
    cp catalina.out catalina.out.${date}
    echo "" > catalina.out
    rm -rf catalina.out.${date7}
done

#定时任务
*************************
0 0 * * * /bin/sh /usr/local/script/tomcat-log.sh
*******************************
