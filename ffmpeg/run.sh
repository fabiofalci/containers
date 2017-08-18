#!/bin/bash
    
echo Generating trf files...
find . -type f -name 'V100*.MOV' -print0 | \
    xargs -0 -P 4 -n 1 -I {} \
    ffmpeg -hide_banner -loglevel panic -i {} -b:v 12000k -b:a 1536k -vf vidstabdetect=shakiness=5:show=1:result={}.trf -f null -
    
echo Generating st files...
find . -type f -name 'V100*.MOV' -print0 | \
    xargs -0 -P 4 -n 1 -I {} \
    ffmpeg -hide_banner -loglevel panic -i {} -b:v 12000k -b:a 1536k -vf vidstabtransform=input={}.trf,unsharp=5:5:0.8:3:3:0.4 {}.st.mov

echo Generating input.txt...
# macos: gfind . -name '*.st.mov' -printf 'file %f\n' | sort > input.txt
find -name '*.st.mov' -printf "file %f\n" | sort > input.txt

echo Concatenating files...
ffmpeg -hide_banner -loglevel panic -f concat -i input.txt -c copy out.mov
