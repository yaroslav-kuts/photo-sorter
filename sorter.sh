#!/bin/bash
for image in $(find ./tosort -type f -regextype egrep -iregex '.*\.(MP4|JPG)$')
do
	date=$(stat -c %y $image | egrep -o '^[0-9]{4}-[0-9]{2}-[0-9]{2}')
	year=$(echo $date | cut -d'-' -f 1)
	month=$(echo $date | cut -d'-' -f 2)
	day=$(echo $date | cut -d'-' -f 3)
	mkdir -p $year/$month.$day.$(echo $year | cut -c3-4)/
	mv $image $year/$month.$day.$(echo $year | cut -c3-4)/
done;

rm -rf ./tosort/*
