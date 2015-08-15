#!/bin/bash

EXT="flac"
find -iname "*.$EXT" | sort | while read filename; do
        trap '{ echo "Hey, you pressed Ctrl-C.  Time to quit." ; exit 1; }' INT
        #echo "$filename"

        if [ -f "${filename%.$EXT}.mp3" ]; then echo Skipping $filename; continue; fi

        currentfolder=`dirname "$filename"`
        coverfile=`find "$currentfolder" -maxdepth 1 -iname "cover.jpg"`
        if [ -f "$coverfile" ];
        then
                #echo $coverfile;
                coverstring=$'-i '"'$coverfile'"' -metadata:s:v title="Album cover" -metadata:s:v comment="Cover (Front)"';
        else
                coverstring="";
        fi
        #echo $coverstring
        command="avconv -v warning -i \"${filename}\" $coverstring -aq 0 \"${filename%.$EXT}.mp3\""
        echo Converting "$filename"
        eval "$command"
done

exit 0
