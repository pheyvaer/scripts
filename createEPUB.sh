#!/bin/bash

zip -X $2 $1/mimetype
zip -rg $2 $1/META-INF -x \*.DS_Store
zip -rg $2 $1/OEBPS -x \*.DS_Store
