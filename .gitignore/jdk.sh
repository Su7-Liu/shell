#!/bin/bash
# 卸载JDK
rpm -qa | grep jdk |xargs rpm -e --nodeps
# 安装JDK
rpm -ivh jdk*.rpm

# 修改系统环境变量
cat >> /etc/profile << EOF
export JAVA_HOME=/usr/java/jdk1.8.0_121
export JRE_HOME=\${JAVA_HOME}/jre
export CLASSPATH=.:\${JAVA_HOME}/lib:\${JRE_HOME}/lib
export PATH=\${JAVA_HOME}/bin:\$PATH
EOF
# 生效环境变量	
source /etc/profile
