#!/bin/bash
# Aigerim Shintemirova, 1550398
# ashin26@uw.edu
string=`echo -n  $1 | wc -c`

stars=$(echo "$1" | sed 's/./ */g')

output() { printf "*%s*\n" "$1"; }

output "$stars"
for i in {1..5}
do
echo "* $1 *"
done
output "$stars"
