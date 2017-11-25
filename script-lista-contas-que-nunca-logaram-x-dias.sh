#!/bin/bash
#jeferson Araujo de Sousa

cts=`zmaccts | grep never | cut -c 1-40` 
# for i in $cts; do
#    zmmailbox -z -m $i emptyFolder /Inbox
# done
