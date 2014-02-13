#!/bin/sh
echo Content-type: text/html
echo ""

output=$(df -h | grep '/tmp\|sda3' | awk '{print $2;}')
echo $output