#!/bin/bash
password=`cat openmrs-standalone-runtime.properties | grep connection.password | awk -F= '{print $2}'`
connection_url=`cat openmrs-standalone-runtime.properties | grep connection.url | awk -F'&server.socket=' '{print $2}'`
connection_tail=".sock"
connection_head="/tmp/openmrs"
connection_beginning=${connection_url%$connection_tail*}
socket=${connection_beginning#*$connection_head}
database/bin/mysql -u openmrs --password="$password" --socket=/tmp/openmrs$socket.sock --max_allowed_packet=96M
