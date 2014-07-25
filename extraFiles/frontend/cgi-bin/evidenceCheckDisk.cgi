#!/bin/sh
echo Content-type: text/html
echo ""

source defs.cgi


if [ $FABRIC/$DEF_IQN/tpgt_1/enable == 1 ] ; then 
echo "exported"
else
echo "notexported"
fi

