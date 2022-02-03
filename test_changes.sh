
compare_files () {
   echo "checking diff"
   diff tempV8.bin tempV9.bin | wc -l | awk '{print "!!!!! NUMBER OF ERRORS =======================> "$0}'
   head -3 tempV9.bin
   echo "done checking diff"
   echo ""
   echo ""
}

run_straw () {
   # time
   ./straw_original "$1" "$2" "$3" "$4" BP "$5" > tempV8.bin
   ./straw "$1" "$2" "$3" "$4" BP "$5" > tempV9.bin
   compare_files
}

hfile="/Users/mshamim/Desktop/hicfiles/GM12878_intact_18.7B_8.15.20_30.hic"

echo "local NONE test 1"
run_straw NONE $hfile "5:10000000:50000000" "5:10000000:50000000" 1000000

echo "local NONE test 2"
run_straw NONE $hfile "5:10000000:50000000" "6:10000000:50000000" 1000000

echo "local SCALE test 1"
run_straw SCALE $hfile "2:10000000:50000000" "2:10000000:50000000" 1000000

echo "local SCALE test 2"
run_straw SCALE $hfile "2:10000000:50000000" "3:10000000:50000000" 1000000

echo "local SCALE test 3"
run_straw SCALE $hfile "2:10000000:50000000" "1:10000000:50000000" 100000

echo "local SCALE test 4"
run_straw SCALE $hfile "7:10000000:10500000" "7:10000000:10500000" 100000

echo "URL KR test 1"
run_straw KR "https://hicfiles.s3.amazonaws.com/hiseq/gm12878/in-situ/maternal.hic" "2:10000000:50000000" "1:10000000:50000000" 1000000

echo "URL KR test 2"
run_straw KR "https://hicfiles.s3.amazonaws.com/hiseq/gm12878/in-situ/paternal.hic" "2:10000000:50000000" "4:10000000:30000000" 1000000
