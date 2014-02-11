#!/bin/sh
echo Content-type: text/html
echo ""

/bin/cat << EOM
<HTML>
<HEAD><TITLE>Firebrick is now powered off</TITLE>
</HEAD>
<body>
<h1> Firebrick is now powered off </h1>
You can close this window.
EOM

poweroff