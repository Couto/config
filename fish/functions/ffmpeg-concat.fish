function ffmpeg-concat 
  for f in *.mp4;  echo "file '$f'"; end >> mylist.txt;
  ffmpeg -f concat -safe 0 -i mylist.txt -c copy output.mp4
  mv output.mp4 $argv
end
