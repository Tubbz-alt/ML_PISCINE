
shopt -s globstar

#unzip, create and move folders:

unzip taylor_sub_11_14.zip

unzip taylor_11_22.zip
rm -rf __MACOSX
cd taylor_11_22
mv 11_22 ..
cd ..
rm -rf taylor_11_22

unzip taylor_11_25_public.zip
rm -rf __MACOSX
mv taylor_11_25_public 11_25

unzip test_data.zip

mkdir train_data
mv 11_14 train_data
mv 11_22 train_data
mv 11_25 train_data


#join wav train files
cd train_data
for i in ./**
do
	if [[ -f "$i"  &&  ${i} =~ ".wav" ]];then
		DIR="$( echo ${i} |  awk -F/ '{ print $2 }')"
		FILE=$(basename $i)
		NEWFILE="$DIR$FILE"
		ORIG_DIR=$(dirname $i)
		NEWFILE="$ORIG_DIR/$NEWFILE"
		mv $i $NEWFILE
	fi
done

for i in *
do
	cd $i
	cp -r one ..
	cp -r two ..
	cd ..
done

mkdir combined
mv one combined
mv two combined