#!/bin/bash

dest='./../'

getstamp() {
	date=$(stat -c %y $1 | egrep -o '^[0-9]{4}-[0-9]{2}-[0-9]{2}')
	year=$(echo $date | cut -d'-' -f 1)
	month=$(echo $date | cut -d'-' -f 2)
	day=$(echo $date | cut -d'-' -f 3)
	echo $year/$month.$day.$(echo $year | cut -c3-4)
}

for image in $(find . -type f -regextype egrep -iregex '.*\.(MP4|JPG|JPEG)$')
do
	stamp=$dest$(getstamp $image)
	title=$(find $stamp* -type d)
	if [ $(echo $title | grep -o $stamp) == $stamp ]
	then
		mv $image $stamp*
	else
		mkdir -p $stamp
		mv $image $stamp
	fi
done;

for file in $(ls | egrep '[^sorter\.sh]')
do
	rm -rf $file
done;
