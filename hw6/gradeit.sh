#!/bin/bash
#Aigerim Shintemirova, 1550398, ashin26@uw.edu

if [ -z $1 ]; then  # check for empty string/no argument
    echo "Usage: ./gradeit.sh MAXPOINTS"
else
    echo "Retro Grade-It, 1970s version"
    echo "Grading with a max score of $1"
    echo 
	SCORE=$1
    for STUDENTID in `ls students/`; do
	echo "Processing $STUDENTID ..."
	cd students/$STUDENTID/
	if [ -e gettysburg.sh ]; then  # check if the student turned in the correct file
	    bash ./gettysburg.sh > output.txt  
	cd .. && cd ..
		# LINES shows number of lines unmatching from expected.txt (ignores white space with -w)
		LINES=`diff -w expected.txt ./students/$STUDENTID/output.txt | grep -e '<' -e '>'| wc -l`
		if [ $LINES -gt 0 ]; then
			echo "$STUDENTID has incorrect output ($LINES lines do not match)"
		else
			echo "$STUDENTID has correct output"
		fi
			#rm ./students/$STUDENTID/output.txt  
		let A="$SCORE - 5 * $LINES"  # 5 pts off per one incorrect line
		COMMENTS=`grep "#" ./students/$STUDENTID/gettysburg.sh | wc -l`
		echo "$STUDENTID has $COMMENTS lines with comments"
		if [ $COMMENTS -ge 3 ]; then
			let TOTALSCORE=$A
		else
			let TOTALSCORE="$A - 7"
		fi
		
		if [ $TOTALSCORE -le 0 ]; then
			echo "$STUDENTID has earned a score of 0 / $SCORE"
		else
			echo "$STUDENTID has earned a score of $TOTALSCORE/$SCORE"
		fi
	
	else # If the student did not turn in the program or incorrectly named the file -> 0 points awarded
	    echo "$STUDENTID did not turn in the assignment"
	    echo "$STUDENTID has eanred a score of 0 / $SCORE"
	    cd .. && cd ..
	fi
	echo
    done
fi
