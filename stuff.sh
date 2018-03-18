#!/bin/bash
afile="/home/malin/var/t"
bfile="/home/malin/var/temps"

truncate -s 0 "$afile"
while true; do
	truncate -s 0  $afile
	sensors | grep 'Core'  | awk '{ print substr($3,2,2)}' > $afile 
	while IFS= read -r line
	do
		let "p = p + 1"
		arr["p"]="$line" 
		echo ${arr["p"]}
		echo "$line" > "$bfile"/"$p"
	done <"$afile"
	sleep 2
	let "p=0"
done;
