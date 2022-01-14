echo "local NONE test 1"

hfile="/Users/mshamim/Desktop/hicfiles/GM12878_intact_18.7B_8.15.20_30.hic"

./straw_original NONE $hfile 5:10000000:50000000 5:10000000:50000000 BP 1000000 > tempV8.bin
./straw NONE $hfile 5:10000000:50000000 5:10000000:50000000 BP 1000000 > tempV9.bin 

echo "...{"
md5 *.bin
head -3 *.bin
echo "DIFF::::"
diff tempV8.bin tempV9.bin 
echo "...}"

echo "local NONE test 2"

./straw_original NONE $hfile 5:10000000:50000000 6:10000000:50000000 BP 1000000 > tempV8.bin
./straw NONE $hfile 5:10000000:50000000 6:10000000:50000000 BP 1000000 > tempV9.bin 

echo "...{"
md5 *.bin
head -3 *.bin
echo "DIFF::::"
diff tempV8.bin tempV9.bin 
echo "...}"

echo "local SCALE test 1"

./straw_original SCALE $hfile 2:10000000:50000000 2:10000000:50000000 BP 1000000 > tempV8.bin
./straw SCALE $hfile 2:10000000:50000000 2:10000000:50000000 BP 1000000 > tempV9.bin

echo "...{"
md5 *.bin
head -3 *.bin
echo "DIFF::::"
diff tempV8.bin tempV9.bin
echo "...}"

echo "local SCALE test 2"

./straw_original SCALE $hfile 2:10000000:50000000 3:10000000:50000000 BP 1000000 > tempV8.bin
./straw SCALE $hfile 2:10000000:50000000 3:10000000:50000000 BP 1000000 > tempV9.bin

echo "...{"
md5 *.bin
head -3 *.bin
echo "DIFF::::"
diff tempV8.bin tempV9.bin
echo "...}"

echo "local SCALE test 3"

./straw_original SCALE $hfile 2:10000000:50000000 1:10000000:50000000 BP 1000000 > tempV8.bin
./straw SCALE $hfile 2:10000000:50000000 1:10000000:50000000 BP 1000000 > tempV9.bin

echo "...{"
md5 *.bin
head -3 *.bin
echo "DIFF::::"
diff tempV8.bin tempV9.bin
echo "...}"


echo "URL KR test 1"

./straw_original KR https://hicfiles.s3.amazonaws.com/hiseq/gm12878/in-situ/maternal.hic 2:10000000:50000000 1:10000000:50000000 BP 1000000 > tempV8.bin
./straw KR https://hicfiles.s3.amazonaws.com/hiseq/gm12878/in-situ/maternal.hic 2:10000000:50000000 1:10000000:50000000 BP 1000000 > tempV9.bin

echo "...{"
md5 *.bin
head -3 *.bin
echo "DIFF::::"
diff tempV8.bin tempV9.bin
echo "...}"




