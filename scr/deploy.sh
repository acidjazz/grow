#!/bin/bash

s3cmd --config=/Users/k/.s3jeffcfg  --exclude 'cof/*' --exclude 'sty/*' --exclude 'tpl/*' --exclude '.git/*' --exclude '.DS_Store' --exclude 'css/_*' --exclude 'scr/*' --exclude 'cfg/*' --exclude 'node_modules/*' sync . s3://weedcalculator.com/
s3cmd setacl --config=/Users/k/.s3jeffcfg s3://weedcalculator.com/ --acl-public --recursive
