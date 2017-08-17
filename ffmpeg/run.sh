#!/bin/bash
    
find . -type f -name 'V100*.MOV' -print0 | \
    xargs -0 -P 4 -n 1 -I {} \
    ffmpeg -i {} -b:v 12000k -vf vidstabdetect=shakiness=5:show=1:result={}.trf -f null -
    
find . -type f -name 'V100*.MOV' -print0 | \
    xargs -0 -P 4 -n 1 -I {} \
    ffmpeg -i {} -b:v 12000k -vf vidstabtransform=input={}.trf,unsharp=5:5:0.8:3:3:0.4 {}.st.mov

# macos: gfind . -name '*.st.mov' -printf 'file %f\n' | sort > input.txt
find -name '*.st.mov' -printf "file %f\n" | sort > input.txt

ffmpeg -f concat -i input.txt -c copy out.mov
