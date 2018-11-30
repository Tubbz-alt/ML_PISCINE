#this script requires GNU parallel and imagemagick installed

#It goes through subvocalization train data, merges wavs from 4 mono channels into 4ch wav and creates spectrograms from merged wav

cd train_data
cd combined

for i in * ; do
	if [ -d $i ]; then
		cd "${i}"

		mkdir "${i}_merged"

		cd "ch1"
		for name in *; do
			sox -M "./${name}"  "../ch2/${name}" "../ch3/${name}" "../ch4/${name}" "../${i}_merged/${name}"
		done
		cd ..


		cd "${i}_merged"
		#find . -name "*wav" | parallel -I% --max-args 1 sox % -n rate 250 spectrogram -Y 263 -x 224 -h -l -r -o %.png

		#data augmentation
		#find . -name "*wav" | parallel -I% --max-args 1 sox % -n rate 300 spectrogram -Y 263 -x 224 -h -l -r -o %1.png
		#find . -name "*wav" | parallel -I% --max-args 1 sox % -n rate 250 spectrogram -Y 263 -x 224 -w kaiser -h -l -r -o %2.png
		find . -name "*wav" | parallel -I% --max-args 1 sox % -n rate 300 spectrogram -Y 263 -x 224 -w kaiser -h -l -r -o %3.png
		#find . -name "*wav" | parallel -I% --max-args 1 sox % -n rate 250 spectrogram -Y 263 -x 224 -w hamming -h -l -r -o %4.png
		#find . -name "*wav" | parallel -I% --max-args 1 sox % -n rate 300 spectrogram -Y 263 -x 224 -w hamming -h -l -r -o %5.png
		#find . -name "*wav" | parallel -I% --max-args 1 sox % -n rate 250 spectrogram -Y 263 -x 224 -w bartlett -h -l -r -o %6.png
		#find . -name "*wav" | parallel -I% --max-args 1 sox % -n rate 300 spectrogram -Y 263 -x 224 -w bartlett -h -l -r -o %7.png

		mkdir $i

		sleep 1m

		#mogrify -crop 256x256+0+7 -path "./${i}" *.png

		find . -name "*.png" -size -1k -delete #remove empty if any
		mv *.png $i

		if [ ! -d  "../../../combined_spectrograms" ]; thenS
			mkdir -p "../../../combined_spectrograms"
		fi

		#sleep 1m
		mv $i "../../../combined_spectrograms/"
		#rm *.png

		cd ..
		cd ..
	fi
done


