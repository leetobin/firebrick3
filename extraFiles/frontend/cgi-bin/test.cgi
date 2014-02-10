#!/bin/sh

echo Content-type: text/html
echo ""

/bin/cat << EOM
<HTML>
<HEAD><TITLE>FIRESTOR</TITLE>
</HEAD>
<BODY bgcolor="#cccccc" text="#000000">
<P>
<SMALL>
<PRE>
EOM

ls -la /firestor


CAT << EOM
</PRE>
</SMALL>
<P>
</BODY>
</HTML>
EOM