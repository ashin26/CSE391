#!/bin/bash
# Aigerim Shintemirova, 1550398
# ashin26@uw.edu

for file in $@; do
	echo "$file: "
	lines=`wc -l < $file`
	echo "  lines: $lines"
	
	nblank=`grep "." $file | wc -l`
	let blankLines="$lines-$nblank"
	
	let percent="$blankLines*100/$lines"
	echo "  blank: $blankLines ($percent%)"
	
done

