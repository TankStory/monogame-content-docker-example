#!/bin/bash

CONTENT_OUT=/src/content-out/
CONTENT_TEMP=/tmp/content

mkdir -p $CONTENT_OUT
mkdir -p $CONTENT_TEMP

dotnet mgcb /@:content.mgcb \
	/clean \
	/outputDir:$CONTENT_OUT \
	/intermediateDir:$CONTENT_TEMP \
	/platform:DesktopGL

ls -R1 $CONTENT_OUT