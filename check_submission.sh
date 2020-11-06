#!/bin/bash

YOUR_ZIP=$1

chmod +x run_test.sh
echo "Test Results:" > feedback.txt

NAME=$(basename -- "${YOUR_ZIP}")
NAME="${NAME%.*}"
mkdir ${NAME}
unzip -qq ${NAME} -d ${NAME}
	
if [ -d "${NAME}" ]; then
	cd $NAME
else
	echo "ERROR in ${YOUR_ZIP}"
	exit 1
fi

for i in $(seq 1 5); do
	curr_file="ex${i}.asm"
	if [ -f "${curr_file}" ]; then
		for j in $(seq 1 1); do
			curr_test=../tests/test_${i}_${j}
			if [ -f "${curr_test}" ]; then
				../run_test.sh "${curr_file}" "${curr_test}" >> ../feedback.txt
			else
				echo "${curr_test} not found"
				curr_test_name=$(basename -- "${curr_test}")
				echo "${curr_file} could not be tested with ${curr_test_name}: FAIL" >> ../feedback.txt
			fi;
		done
	else		
		echo "${curr_file} not found"
		echo "${curr_file} could not be tested, therefore: FAIL" >> ../feedback.txt
	fi;
done

cd ..
sudo rm $NAME -rf
echo "END OF CHECK!"
echo "If you have no 'FAIL' in 'feedback.txt' - OK to submit :)"
