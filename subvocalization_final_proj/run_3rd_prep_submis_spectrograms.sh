#this script requires GNU parallel installed

#It goes through subvocalization train data, merges wavs from 4 mono channels into 4ch wav, and creates spectrograms from merged wav

cd test_data


for i in * ; do
	if [ -d $i ]; then
		cd "${i}"

		find . -name "*wav" | parallel -n 4  sox -M {} "../${i}.wav"

		cd ..
	fi
done

mkdir "merged"
mv *.wav "merged"
mkdir "spectrograms_combined_test"
cd "merged"

find . -name "*wav" | parallel -I% --max-args 1 sox % -n rate 300 spectrogram -Y 263 -x 224 -w kaiser -h -l -r -o %.png

sleep 1m #wait for parallel processes to complete

#mogrify -crop 224x256+0+7 -path "../spectrograms_combined_test/" *.png

#sleep 1m #wait for parallel processes to complete

mv *.png "../spectrograms_combined_test/"