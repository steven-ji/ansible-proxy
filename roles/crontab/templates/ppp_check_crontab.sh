#!/bin/bash
#ppp=`ifconfig | grep ppp | wc -l`
ppp=`ps -ef | grep pppoe | wc -l`
echo "ppp $ppp"
if [ $ppp -gt 5 ]; then
  echo "ppp count $ppp"
  ps -ef | grep pppoe | awk '{print $2}' | xargs  kill -9
  rm -rf /var/run/ppp*.pid
  rm -rf /var/run/ppp*.pid.*
  echo "kill all pppoe success!"
  sleep 1
  current=`ifconfig | grep ppp | wc -l`
  echo "current ppp count $current"
fi
