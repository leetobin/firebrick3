#!/bin/sh
echo Content-type: text/html
echo ""

/scripts/exportEvidence.sh

echo "Evidence exported over iSCSI"
