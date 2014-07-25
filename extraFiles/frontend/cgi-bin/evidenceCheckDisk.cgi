#!/bin/sh
echo Content-type: text/html
echo ""

source defs.cgi


if grep -q "1" $FABRIC/$DEF_IQN/tpgt_1/enable  ; then 
echo "exported in $FABRIC/$DEF_IQN/tpgt_1/enable"
else
echo "notexported in $FABRIC/$DEF_IQN/tpgt_1/enable"
fi

